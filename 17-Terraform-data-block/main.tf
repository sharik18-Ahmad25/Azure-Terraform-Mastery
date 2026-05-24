
# 1. AZURE PROVIDER CONFIGURATION
terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.73.0"
    }
  }
}
provider "azurerm" {
    features {
      
    }
  
}

#2.DATA BLOCK (Read-Only: Fetch details of existing resources)

# This block will go to the Azure portal and look for an already existing Resource Group.

# Prerequisite:** A Resource Group named **"my-existing-rg"** must already be created manually in Azure.


data "azurerm_resource_group" "portal_rg" {
    name = "my-existing-rg"
  
}

#3.RESOURCE BLOCK (Write/Create: Build new infrastructure)

# Here, we are creating a new VNet, but its **location** and **resource group name** are being dynamically fetched from the above **DATA BLOCK**.

resource "azurerm_virtual_network" "my-vnet" {
    name = "vnet-01"

   #This is where it is dynamically linking from the **Data Block**.
    resource_group_name = data.azurerm_resource_group.portal_rg.name
    location = data.azurerm_resource_group.portal_rg.location
    address_space = [ "10.0.0.0/16"]
}