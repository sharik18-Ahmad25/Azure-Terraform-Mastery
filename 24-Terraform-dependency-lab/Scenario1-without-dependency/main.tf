terraform {
  required_providers {
    azurerm ={
        source = "hashicorp/azurerm"
        version = "4.74.0"
    }
  }
}
provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "rg" {
    name     = "rg-crash-test-sharik"
  location = "East US"
  
}

resource "azurerm_storage_account" "storage" {
  name                     = "sharikcrashteststg001"
  resource_group_name      = "rg-crash-test-sharik"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}