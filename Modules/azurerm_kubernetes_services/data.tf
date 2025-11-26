data "azurerm_container_registry" "CRData" {
  for_each            = var.kubernetes_cluster
  name                = each.value.acr_name
  resource_group_name = each.value.resource_group_name
}
