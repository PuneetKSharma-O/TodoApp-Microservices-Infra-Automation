resource_group = {
  "rg1" = {
    name     = "rg-dev1"
    location = "centralindia"
  }
  "rg2" = {
    name     = "rg-dev2"
    location = "centralindia"
  }
}
storage_account = {
  "stg1" = {
    name                     = "devtodomicrostg123456"
    resource_group_name      = "rg-dev1"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
  }
}

kubernetes_cluster = {
  "AKS1" = {
    name                = "dev-aks-cluster2"
    location            = "centralindia"
    dns_prefix          = "devaks1"
    resource_group_name = "rg-dev1"
    acr_name            = "todomicroservicesacr1234"
    default_node_pool = {
      name       = "default"
      node_count = 2
      vm_size    = "Standard_B2s"
    }
    ingress_application_gateway = {
      enabled = true
    }
    identity = {
      type = "SystemAssigned"
    }
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
  }
}
acr = {
  "AKS1" = {
    name                = "todomicroservicesacr1234"
    resource_group_name = "rg-dev1"
    location            = "centralindia"
    sku                 = "Basic"
    admin_enabled       = true
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
  }
}

sql_db_server = {
  "sqlserver1" = {
    name                         = "devtodomicrosqlsvr1234"
    resource_group_name          = "rg-dev1"
    location                     = "centralindia"
    secret_name                  = "db-user-login"
    secret_pass                  = "db-user-password"
    key_vault_name               = "dev-todo-kv-1234567"
    version                      = "12.0"
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
  }
}
sql_db = {
  "sqlserver1" = {
    sql_server_name     = "devtodomicrosqlsvr1234"
    resource_group_name = "rg-dev1"
    name                = "devtodomicrosqldb1234"
  }
}

key_vaults = {
  "kv1" = {
    name                        = "dev-todo-kv-1234567"
    location                    = "centralindia"
    resource_group_name         = "rg-dev1"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
    rbac_authorization_enabled  = true
  }
}
key_vault_secret = {
  secret1 = {
    secret_name         = "db-user-login"
    secret_type         = "sqladminuser"
    key_vault_name      = "dev-todo-kv-1234567"
    resource_group_name = "rg-dev1"
  }
    secret2 = {
    secret_name         = "db-user-password"
    secret_type         = "dbP@ssw0rd1234!"
    key_vault_name      = "dev-todo-kv-1234567"
    resource_group_name = "rg-dev1"
  }
}