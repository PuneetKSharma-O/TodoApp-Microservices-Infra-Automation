variable "key_vaults" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = optional(bool)
    soft_delete_retention_days  = optional(number)
    purge_protection_enabled    = optional(bool)
    sku_name                    = string
    rbac_authorization_enabled  = optional(bool)
  }))
}