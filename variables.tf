
variable "names" {
  description = "Names to be applied to resources (inclusive)"
  type = object({
    environment         = string
    location            = string
    market              = string
    business_unit       = string
    product_name        = string
    project             = string
    product_group       = string
    resource_group_type = string
    subscription_type   = string
    resource_group_type = string
    subscription_id     = string

  })
}
# ACR Variables
variable "sku" {
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium"
  type        = string
  default     = "Basic"

  validation {
    condition     = can(regex("^(Basic|Standard|Premium)$", var.sku))
    error_message = "Invalid sku. Valid options are Basic, Standard and Premium."
  }
}

