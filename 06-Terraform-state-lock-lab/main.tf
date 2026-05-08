terraform {
    backend "azurerm" {
        resource_group_name = "state-rg"
        storage_account_name = "lockstr18"
        container_name = "lockcntr"
        key = "terraform.tfstate"
      
    }
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

resource "azurerm_resource_group" "state-lab" {
    name = "state-rg"
    location = "east us"
  
}

resource "azurerm_storage_account" "state-str" {
    name = "lockstr18"
    resource_group_name = azurerm_resource_group.state-lab.name
    location = azurerm_resource_group.state-lab.location
    account_tier = "Standard"
    account_replication_type = "LRS"
      
}


resource "azurerm_storage_container" "statecntr" {
    name = "lockcntr"
    storage_account_id = azurerm_storage_account.state-str.id
    container_access_type = "private"  
}

