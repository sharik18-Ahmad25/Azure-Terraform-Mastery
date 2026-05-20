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

resource "azurerm_resource_group" "nested_rg" {
  for_each = var.environment_configuration

  name     = each.value.resource_group_name
  location = each.value.location

}