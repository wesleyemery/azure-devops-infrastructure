locals {
  name = "${data.azurerm_subscription.current.display_name}-${var.names.location}"
}