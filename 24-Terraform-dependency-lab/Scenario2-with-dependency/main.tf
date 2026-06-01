terraform {
  required_providers {
    azurerm = {
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
      name     = "rg-crash-test-sharik1"
  location = "East US"
  
}

resource "azurerm_storage_account" "storage1" {
    name = "sharikcrashteststg00123"
    resource_group_name = azurerm_resource_group.rg.name # implicit 
    location = azurerm_resource_group.rg.location # implicit 
    account_tier = "Standard"
    account_replication_type = "LRS"

    depends_on = [
    azurerm_resource_group.rg #  Explicit 
  ]
}

