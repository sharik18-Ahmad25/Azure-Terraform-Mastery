resource "azurerm_resource_group" "cricket-rgs" {
    count = length(var.rgs_names)
    name = var.rgs_names[count.index]
    location = var.location
  
}