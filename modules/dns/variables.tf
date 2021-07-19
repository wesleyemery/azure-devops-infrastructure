variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "name" {
  description = "Names to be applied to resources"
  type        = string
}

variable "zone_name" {
  description = "Zone name"
  type        = string
}

variable "records" {
  description = "Added DNS record"
  type = list
}