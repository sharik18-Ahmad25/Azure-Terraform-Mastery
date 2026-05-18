terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }
  }
}

provider "azurerm" {
  features {

  }

}

resource "azurerm_resource_group" "demolab" {
  for_each = toset(["rg1", "rg2", "rg3"])
  name     = each.key
  location = "east us"

}