variable "name" {
  description = "Names for ingress controller"
  type        = string
}

variable "namespace" {
  description = "Namespace for ingress controller"
  type = string
}

variable "create_namespace" {
  description = "Boolean to create namespace"
  type = bool
  default = false
}