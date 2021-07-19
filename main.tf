resource "random_string" "random" {
  length  = 6
  upper   = false
  number  = false
  special = false
}

module "naming" {
  source = "github.com/Azure-Terraform/example-naming-template.git?ref=v1.0.0"
}

module "metadata" {
  source = "github.com/Azure-Terraform/terraform-azurerm-metadata.git?ref=v1.5.0"

  naming_rules = module.naming.yaml

  market              = var.names.market
  project             = var.names.project
  location            = var.names.location
  environment         = "sandbox"
  product_name        = random_string.random.result
  business_unit       = var.names.business_unit
  product_group       = var.names.business_unit
  subscription_id     = var.names.subscription_id
  subscription_type   = var.names.subscription_type
  resource_group_type = var.names.resource_group_type
}

resource "azurerm_resource_group" "rg" {
  location = var.names.location
  name     = "rg-${local.name}"
  tags     = module.metadata.tags
}

module "virtual_network" {
  source = "github.com/Azure-Terraform/terraform-azurerm-virtual-network.git"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.names.location
  names               = module.metadata.names
  tags                = module.metadata.tags

  address_space        = ["10.1.0.0/21"]
  enforce_subnet_names = false

  subnets = {
    iaas-public = { cidrs = ["10.1.0.0/24"]
      allow_vnet_inbound  = true
      allow_vnet_outbound = true
    }
    iaas-private = { cidrs = ["10.1.1.0/24"]
      allow_vnet_inbound  = true
      allow_vnet_outbound = true
    }
    GatewaySubnet = { cidrs = ["10.1.2.0/24"]
      create_network_security_group = false
    }
  }
}

module "kube" {
  source = "github.com/Azure-Terraform/terraform-azurerm-kubernetes.git?ref=v4.0.0"

  location            = var.names.location
  names               = module.metadata.names
  tags                = module.metadata.tags
  resource_group_name = azurerm_resource_group.rg.name

  identity_type          = "UserAssigned"
  configure_network_role = true
  network_plugin         = "kubenet"

  network_profile_options = {
    docker_bridge_cidr = "192.167.0.1/16"
    dns_service_ip     = "192.168.1.1"
    service_cidr       = "192.168.0.0/16"
  }

  acr_pull_access = {
    "acregistry" = module.acr.id
  }

  rbac = {
    enabled        = false
    ad_integration = false
  }


  virtual_network = {
    subnets = {
      private = {
        id = data.azurerm_subnet.private-subnet.id
      }
      public = {
        id = data.azurerm_subnet.public-subnet.id
      }
    }
    route_table_id = data.azurerm_subnet.private-subnet.route_table_id
  }

  default_node_pool = "system"

  node_pools = {
    system = {
      subnet                       = "private"
      vm_size                      = "Standard_B2s"
      node_count                   = 2
      only_critical_addons_enabled = true
    }

    nodepool1 = {
      vm_size             = "Standard_B2s"
      enable_auto_scaling = true
      min_count           = 1
      max_count           = 3
      subnet              = "private"
    }

    nodepool1 = {
      vm_size             = "Standard_B2s"
      enable_auto_scaling = true
      min_count           = 1
      max_count           = 3
      subnet              = "public"
    }
  }
}

module "nginx" {
  source           = "./modules/nginx-ingress/"
  name             = var.ingress_name
  namespace        = var.namespace
  create_namespace = var.create_namespace
}

module "dns_zone" {
  source              = "./modules/dns-zone"
  tags                = module.metadata.tags
  parent_domain       = var.parent_domain
  subscription_id     = var.names.subscription_id
  resource_group_name = azurerm_resource_group.rg.name
}

module "dns" {
  source              = "./modules/dns"
  depends_on = [module.nginx, module.dns_zone]
  name                = var.dns_name
  resource_group_name = azurerm_resource_group.rg.name
  zone_name           = module.dns_zone.name
  records             = ["10.1.0.24"]
}

module "acr" {
  source              = "./modules/acr/"
  name                = "acr${random_string.random.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.names.location
  sku                 = var.sku
  tags                = module.metadata.tags
}