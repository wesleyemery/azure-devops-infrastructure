variable "namespace" {
  description = "Namespace for ingress controller"
  type = string
  default = ""
}

variable "create_namespace" {
  description = "Boolean to create namespace"
  type = bool
  default = false
}