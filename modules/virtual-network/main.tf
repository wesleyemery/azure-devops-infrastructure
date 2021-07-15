resource "azurerm_virtual_network" "" {
  address_space = var.address_space
  location = var.location
  name = ""
  resource_group_name = ""
}