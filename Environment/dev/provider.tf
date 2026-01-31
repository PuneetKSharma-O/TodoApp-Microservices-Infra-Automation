terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "monotodostg123456"
    resource_group_name  = "dev-rg"
    container_name       = "todo-cnt"
    key                  = "dev.todomicro.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "8768b618-1d05-411a-8909-9fedb0e9db2b"
}
