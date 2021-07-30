resource "azurerm_dns_zone" "zone" {
  name                = lower(var.parent_domain)
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

/*
resource "azurerm_dns_ns_record" "child" {
  name                = var.parent_domain
  zone_name           = lower(var.parent_domain)
  resource_group_name = var.resource_group_name
  ttl                 = 300
  tags                = var.tags

  records = azurerm_dns_zone.zone.name_servers
}*/
