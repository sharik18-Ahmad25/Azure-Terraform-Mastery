resource "azurerm_resource_group" "testing-rg" {
    for_each = toset(var.rg_name)
    name = each.key
    location = var.location
  
}