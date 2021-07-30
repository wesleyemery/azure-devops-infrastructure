locals {
  name = "${data.azurerm_subscription.current.display_name}-${var.names.location}"

  nsg_obj = {
    nginxAllowHTTPInbound = {
      priority = 100
      ip       = data.kubernetes_service.nginx.status.0.load_balancer.0.ingress.0.ip
      port     = 80
    },
    nginxAllowHTTPSInbound = {
      priority = 101
      ip       = data.kubernetes_service.nginx.status.0.load_balancer.0.ingress.0.ip
      port     = 443
    },
    argoAllowHTTPInbound = {
      priority = 102
      ip       = data.kubernetes_service.argocd.status.0.load_balancer.0.ingress.0.ip
      port     = 80
    },
    argoAllowHTTPSInbound = {
      priority = 103
      ip       = data.kubernetes_service.argocd.status.0.load_balancer.0.ingress.0.ip
      port     = 443
    }
  }
}