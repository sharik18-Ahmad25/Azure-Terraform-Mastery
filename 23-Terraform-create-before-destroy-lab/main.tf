locals {
    # 🎯 PHASE 2: Manual change for upgrade tracking
  Storage_version = "v2"
}

#Resource Group
resource "azurerm_resource_group" "sa_rg" {
    name = "sharik_rg"
    location = "East Us"
  
}

#2. Core Storage Account with Lifecycle Guardrail
 
 resource "azurerm_storage_account" "app_storage" {
    name = "srkst${local.Storage_version}" # Dynamic Name: srkstv2
    resource_group_name = azurerm_resource_group.sa_rg.name
    location = azurerm_resource_group.sa_rg.location
    account_tier ="Premium" # 💥 Tier Upgraded to Premium SSD
    account_replication_type = "LRS"
   
 
lifecycle {
  create_before_destroy = true
}

 }