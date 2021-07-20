data "azurerm_subscription" "current" {
}

data "azurerm_route_table" "rtable" {
  name                = "${azurerm_resource_group.rg.name}-default-routetable"
  resource_group_name = azurerm_resource_group.rg.name
}

data "kubernetes_service" "nginx" {
  provider   = kubernetes
  depends_on = [module.nginx]
  metadata {
    name      = var.ingress_name
    namespace = var.namespace
  }
}
