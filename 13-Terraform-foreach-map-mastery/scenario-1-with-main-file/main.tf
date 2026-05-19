terraform {
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

resource "azurerm_resource_group" "map_rg" {
  for_each = {
    "sharik-dev-rg" = "East US"
    "sharik-stage-rg" = "Central US"
    "sharik-prod-rg"  = "West US"


  }

  name = each.key
  location = each.value
}