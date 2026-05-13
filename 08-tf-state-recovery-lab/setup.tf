terraform {
    backend "azurerm" {       #This will upload the state file to Azure using the backend block, specifically to an Azure Storage Account.
        resource_group_name = "sharik-state-mgmt-rg"
        storage_account_name = "sharikstatestore001"
        container_name = "tfstate"
        key = "terraform.tfstate"
      
    }
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.72.0"
    }
  }
}
provider "azurerm" {
  features {
    
  }
}



# 1. Resource Group 
resource "azurerm_resource_group" "state_rg" {
  name     = "sharik-state-mgmt-rg"
  location = "East US"
}

# 2. Storage Account with Data Protection
resource "azurerm_storage_account" "state_sa" {
  name                     = "sharikstatestore001" # Keep it unique
  resource_group_name      = azurerm_resource_group.state_rg.name
  location                 = azurerm_resource_group.state_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  #This is the real magic code that will enable **Versioning** and **Soft Delete**.

  blob_properties {
    versioning_enabled = true # Versioning On

    delete_retention_policy {
      days = 7 # Soft Delete for Blobs On
    }

    container_delete_retention_policy {
      days = 7 # Soft Delete for Containers On
    }
  }
}

# 3. Container for State File
resource "azurerm_storage_container" "state_cont" {
  name                  = "tfstate"
  storage_account_id = azurerm_storage_account.state_sa.id
  container_access_type = "private"
}