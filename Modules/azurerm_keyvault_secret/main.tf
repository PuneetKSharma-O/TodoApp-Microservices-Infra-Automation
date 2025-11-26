resource "azurerm_key_vault_secret" "key_vault_secret" {
  for_each     = var.key_vault_secret
  name         = each.value.secret_name
  value        = each.value.secret_type
  key_vault_id = data.azurerm_key_vault.keyvault_data[each.key].id
}