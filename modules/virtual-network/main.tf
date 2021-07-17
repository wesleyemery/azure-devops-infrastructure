resource "azurerm_virtual_network" "vnet" {
  address_space = var.address_space
  location = var.location
  name = var.name
  resource_group_name = var.resource_group_name
  tags = var.tags
}

//resource "azurerm_subnet" "" {
//  name = var.
//  resource_group_name = ""
//  virtual_network_name = ""
//}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_type
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.cidrs

  service_endpoints = var.service_endpoints

  dynamic "delegation" {
    for_each = var.delegations
    content {
      name = delegation.key
      service_delegation {
        name    = delegation.value.name
        actions = delegation.value.actions
      }
    }
  }
}