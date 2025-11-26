variable "kubernetes_cluster" {
  type = map(object({
    name                = string
    location            = string
    dns_prefix          = string
    resource_group_name = string
    acr_name           = string
    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })
    
    identity = object({
      type = string
    })
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
    
}
