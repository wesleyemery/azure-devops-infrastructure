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

variable "sku" {
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium"
  type        = string
  default     = "Basic"

  validation {
    condition     = can(regex("^(Basic|Standard|Premium)$", var.sku))
    error_message = "Invalid sku. Valid options are Basic, Standard and Premium."
  }
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}