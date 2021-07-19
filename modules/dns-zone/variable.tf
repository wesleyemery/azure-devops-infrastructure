variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "subscription_id" {
  description = "ID of the subscription"
  type        = string
}

variable "parent_domain" {
  description = "pre-existing parent domain in which to create the NS record for the child domain"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources (inclusive)"
  type        = map(string)
}