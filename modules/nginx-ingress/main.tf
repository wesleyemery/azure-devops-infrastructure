#Nginx Ingress
resource "helm_release" "nginx" {
  provider   = helm
  name       = "anheuser-ingress"
  chart            = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  namespace  = var.namespace
  create_namespace = var.create_namespace
  timeout          = 360

  values = [
    file("${path.module}/confd/ingress.yaml")
  ]
}
