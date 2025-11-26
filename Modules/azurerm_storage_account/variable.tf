variable "storage_account" {
    description = "A map of storage account configurations."
    type = map(object({
        name                     = string
        resource_group_name     = string
        location                 = string
        account_tier            = string
        account_replication_type = string
        tags                    = optional(map(string))
    }))
  
}