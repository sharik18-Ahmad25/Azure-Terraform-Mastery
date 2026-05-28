resource "azurerm_resource_group" "rg_secure" {
    name = "sharik-rg"
    location = "East Us"
  
}

resource "azurerm_storage_account" "secure_st" {
    name = "shariksecuresst001"
    resource_group_name = azurerm_resource_group.rg_secure.name
    location = azurerm_resource_group.rg_secure.location
    account_tier = "Standard"
    account_replication_type = "LRS"


public_network_access_enabled = false

}

