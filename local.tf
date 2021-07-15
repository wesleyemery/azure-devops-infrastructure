locals {
  resource_group_name = "${data.azurerm_subscription.current.display_name}-${var.names.location}-${var.names.app_name}"
}