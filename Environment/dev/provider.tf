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
  subscription_id = "ff4b8dcc-265a-4fdf-9501-146b37e6ac66"
}
