resource "azurerm_storage_account" "import_st" {
    name = "sharikmanualst007"
    resource_group_name = "sharik-rg"
    location = "east us"
    account_tier = "Standard"
    account_replication_type = "RAGRS"
    allow_nested_items_to_be_public = false
}