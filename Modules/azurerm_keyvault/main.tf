resource "azurerm_key_vault" "kvault" {
  for_each                    = var.key_vaults
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name                    = each.value.sku_name
  rbac_authorization_enabled  = each.value.rbac_authorization_enabled
}


resource "azurerm_role_assignment" "key_vaults_access" {
  for_each             = var.key_vaults
  scope                = azurerm_key_vault.kvault[each.key].id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}
