output "aks_login" {
  value = "az aks get-credentials --name ${module.kube.name} --resource-group ${azurerm_resource_group.rg.name}"
}