terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "monotodostg12345"
    resource_group_name  = "dev-rg"
    container_name       = "todo-cnt"
    key                  = "dev.todomicro.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "82a45200-ef80-4da2-a03b-18d9a77b29b7"
}
