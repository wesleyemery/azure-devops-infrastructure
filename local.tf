locals {
  name = "${data.azurerm_subscription.current.display_name}-${var.names.location}"

  ipaddresses = {
    argocd = data.kubernetes_service.argocd.status.0.load_balancer.0.ingress.0.ip
    nginx  = data.kubernetes_service.nginx.status.0.load_balancer.0.ingress.0.ip
  }

  rule_list = flatten([
    for k, rule in var.rules : {
      name     = rule.name
      ip       = lookup(local.ipaddresses, rule.type)
      port     = rule.port
      type     = rule.type
      priority = rule.priority
    }
  ])

  rule_map = {
    for rule in local.rule_list : rule.name => rule
  }
}