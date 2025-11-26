variable "acr" {
    description = "A map of Azure Container Registry configurations."
    type = map(object({
        name                = string
        resource_group_name = string
        location            = string
        sku                 = string
        admin_enabled       = bool
        tags                = optional(map(string))
    })) 
  
}