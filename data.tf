data "azurerm_subscription" "current" {
}

data "kubernetes_service" "nginx" {
  depends_on = [module.nginx]
  provider   = kubernetes
  metadata {
    name      = format("%s-ingress-nginx-controller", var.namespace)
    namespace = var.namespace
  }
}

data "kubernetes_service" "argocd" {
  depends_on = [module.argocd]
  provider   = kubernetes
  metadata {
    name      = "argocd-server"
    namespace = "argocd"
  }
}

data "azurerm_route_table" "rtable" {
  depends_on          = [module.virtual_network]
  name                = "${azurerm_resource_group.rg.name}-default-routetable"
  resource_group_name = azurerm_resource_group.rg.name
}
