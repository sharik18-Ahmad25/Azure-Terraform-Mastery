terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.71.0"
    }
  }
}
provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "prod-lab" {
    name = "prod-rg"
    location = "east us"
  
}

resource "azurerm_storage_account" "prodstr" {
    name = "prdstr"
    resource_group_name = azurerm_resource_group.prod-lab.name
    location = azurerm_resource_group.prod-lab.location
    account_tier = "Standard"
    account_replication_type = "LRS"
  
}

resource "azurerm_storage_container" "pcntr" {
    name = "prodcntr"
    storage_account_id = azurerm_storage_account.prodstr.id
    container_access_type = "private"
  
}

resource "azurerm_storage_blob" "demofile" {
    name = "demo_txt"
    storage_account_name = azurerm_storage_account.prodstr.name
    storage_container_name = azurerm_storage_container.pcntr.name
    type = "Block"
    source = "demo.txt"
  
}