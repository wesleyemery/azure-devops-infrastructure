resource "helm_release" "argocd" {
  chart = "argo-cd"
  name = var.name
  repository = "https://argoproj.github.io/argo-helm"
  namespace = var.namespace
  create_namespace = var.create_namespace
  timeout = "300"
}