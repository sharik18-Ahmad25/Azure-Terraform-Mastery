resource "azurerm_resource_group" "backend-lab" {
    for_each = var.rg_name
    name = each.key
    location = each.value
  
}

resource "azurerm_storage_account" "remotestrlab" {
    name = var.storage_account
    resource_group_name = azurerm_resource_group.backend-lab["remote-rg"].name
    location = azurerm_resource_group.backend-lab["remote-rg"].location
    account_tier = var.account_tier
    account_replication_type = var.account_replication_type
  
}

resource "azurerm_storage_container" "cntrlab18" {
    name = var.cotainer
    storage_account_id = azurerm_storage_account.remotestrlab.id
    container_access_type = var.container_access_type
  
}