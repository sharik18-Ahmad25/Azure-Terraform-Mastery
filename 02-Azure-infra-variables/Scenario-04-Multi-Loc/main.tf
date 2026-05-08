resource "azurerm_resource_group" "cricket-rgs" {
    count = length(var.rg_name)
    name = var.rg_name[count.index]
    location = var.locations[count.index]
  
}