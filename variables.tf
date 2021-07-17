variable "names" {
  description = "Names to be applied to resources (inclusive)"
  type = object({
    app_name             = string
    location             = string
    tags                 = map(string)
  })
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