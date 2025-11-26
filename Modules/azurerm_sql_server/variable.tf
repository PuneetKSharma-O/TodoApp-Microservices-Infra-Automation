variable "sql_db_server" {
  description = "A map of SQL Database Server configurations."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    version             = string
    secret_name         = string
    secret_pass         = string
    key_vault_name      = string
    minimum_tls_version = optional(string)
  }))

}
