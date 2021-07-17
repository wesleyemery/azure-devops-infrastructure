variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "name" {
  description = "Names to be applied to resources"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}

# Virtual Network Variables
variable "address_space" {
  description = "CIDRs for virtual network"
  type        = list(string)
}

# Subnet Variables

variable "service_endpoints" {
  description = "service endpoints to associate with the subnet"
  type        = list(string)
  default     = []
}

variable "delegations" {
  description = "delegation blocks for services"
  type        = map(object({
    name    = string
    actions = list(string)
  }))
  default     = {}
}
