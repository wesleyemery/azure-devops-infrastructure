
module "resource_group" {
  source = "github.com/Azure-Terraform/terraform-azurerm-resource-group.git?ref=v2.0.0"

  location = var.names.location
  names    = local.resource_group_name
  tags     = var.names.tags
}