data "azurerm_key_vault" "keyvault_data" {
  for_each = var.sql_db_server
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "kvsecret_data_username" {
  for_each = var.sql_db_server
  name         = each.value.secret_name
  key_vault_id = data.azurerm_key_vault.keyvault_data[each.key].id
}

data "azurerm_key_vault_secret" "kvsecret_data_password" {
  for_each = var.sql_db_server
  name         = each.value.secret_pass
  key_vault_id = data.azurerm_key_vault.keyvault_data[each.key].id
}
