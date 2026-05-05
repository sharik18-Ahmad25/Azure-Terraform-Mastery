resource "azurerm_resource_group" "demo-rg" {
    for_each = var.name_rg
    name = each.key
    location = each.value
  
}