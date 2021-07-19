data "azurerm_subscription" "current" {
}

data "azurerm_virtual_network" "vnet" {
  name                = module.virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.rg.name
}

data "azurerm_subnet" "private-subnet" {
  name                 = "iaas-private"
  virtual_network_name = "infra-dev-eastus2-vnet"
  resource_group_name  = azurerm_resource_group.rg.name
}

data "azurerm_subnet" "public-subnet" {
  name                 = "iaas-public"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
}

data "kubernetes_service" "nginx" {
  provider   = kubernetes
  depends_on = [module.nginx]
  metadata {
    name      = var.ingress_name
    namespace = var.namespace
  }
}
