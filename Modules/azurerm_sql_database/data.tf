data "azurerm_mssql_server" "mssql_server_data" {
    for_each = var.sql_db
  name                = each.value.sql_server_name
  resource_group_name = each.value.resource_group_name
}