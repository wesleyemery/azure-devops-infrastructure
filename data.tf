data "azurerm_subscription" "current" {
}

data "kubernetes_service" "nginx" {
  provider   = kubernetes
  metadata {
    name      = format("%s-ingress-nginx-controller", var.namespace)
    namespace = var.namespace
  }

}

data "azurerm_route_table" "rtable" {
  name                = "${azurerm_resource_group.rg.name}-default-routetable"
  resource_group_name = azurerm_resource_group.rg.name
}
