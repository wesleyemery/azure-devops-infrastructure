resource "random_string" "random" {
  length  = 6
  upper   = false
  number  = false
  special = false
}

resource "azurerm_resource_group" "rg" {
  location = var.names.location
  name = "rg-${local.name}"
  tags = var.names.tags
}

module "vnet" {
  source = "./modules/virtual-network/"
  address_space = ["10.0.0.0/16"]
  location = var.names.location
  name = "vnet-${local.name}"
  resource_group_name = azurerm_resource_group.rg.name
  tags = var.names.tags
}

module "acr" {
  source = "./modules/acr/"
  name                     = "acr${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.names.location
  sku                      = var.sku
  tags = var.names.tags
}