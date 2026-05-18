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

resource "azurerm_resource_group" "demovar" {
    for_each = toset(var.rg_names)
    name = each.key
    location = var.locations_of_rg
  
}