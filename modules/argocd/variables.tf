variable "name" {
  description = "Name of ArgoCD helm deployment"
  type = string
}

variable "namespace" {
  description = "Namespace of ArgoCD helm deployment"
  type = string
}

variable "create_namespace" {
  description = "Create namespace for ArgoCD helm deployment"
  type = bool
}

