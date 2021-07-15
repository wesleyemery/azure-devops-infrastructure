variable "names" {
  description = "Names to be applied to resources (inclusive)"
  type = object({
    app_name             = string
    location             = string
    tags                 = map(string)
  })
}