resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.sql_db_server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.kvsecret_data_username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.kvsecret_data_password[each.key].value
  minimum_tls_version          = each.value.minimum_tls_version

  tags = {
    environment = "production"
  }
}

