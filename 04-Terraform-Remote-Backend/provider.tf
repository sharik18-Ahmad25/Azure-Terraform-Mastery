terraform {
    backend "azurerm" {
        resource_group_name = "remote-rg"
        storage_account_name = "remotestr18"
        container_name = "remotecntr"
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