resource "azurerm_virtual_network" "vnet" {
  address_space = var.address_space
  location = var.location
  name = var.vnet_name
  resource_group_name = var.resource_group_name
  tags = var.tags
}

resource "azurerm_subnet" "" {
  name = var.
  resource_group_name = ""
  virtual_network_name = ""
}