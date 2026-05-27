terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.74.0"
    }
  }
}

provider "azurerm" {
  features {

  }

}

resource "azurerm_resource_group" "name" {
  name     = "rg1"
  location = "east us"

}

resource "azurerm_storage_account" "stname" {
  name                     = "driftstr01"
  resource_group_name      = azurerm_resource_group.name.name
  location                 = azurerm_resource_group.name.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}