terraform {
  required_providers {
    azurerm= {
        source = "hashicorp/azurerm"
        version = "4.72.0"
    }
  }
}

provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "multi-rg" {
    for_each = var.multi-rg_storage_accounts
    name = each.value.resource_group_name
    location = each.value.location
}
   
   resource "azurerm_storage_account" "multi-str" {
    for_each = var.multi-rg_storage_accounts
    name = each.value.name
    location = each.value.location
    resource_group_name = azurerm_resource_group.multi-rg[each.key].name
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type
     
   }