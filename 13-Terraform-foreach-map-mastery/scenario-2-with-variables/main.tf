terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"

    }
  }
}
provider "azurerm" {
    features{}
  
}

resource "azurerm_resource_group" "map_rg_var" {
  for_each = var.rg_environments
  name     = each.key
  location = each.value

}