resource "azurerm_resource_group" "rg" {
  for_each   = var.resource_group
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
  tags       = each.value.tags
}


output "rgid" {
  value = {for rg_key, rg_value in azurerm_resource_group.rg : rg_key => rg_value.id}
}