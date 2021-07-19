resource "azurerm_dns_a_record" "dns-records" {
  name                = var.name
  resource_group_name = var.resource_group_name
  records             = var.records
  zone_name           = var.zone_name
  ttl                 = 300
}