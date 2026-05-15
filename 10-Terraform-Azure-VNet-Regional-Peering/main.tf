# Resource Group
resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location
  
}

#Vnet A

resource "azurerm_virtual_network" "vnet_a" {
    name = "vnet-hub"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    address_space = var.vnet_hub_cidr
  
}

#Vnet B

resource "azurerm_virtual_network" "vnet_b" {
    name = "vnet-spoke"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    address_space = var.vnet_spoke_cidr
  
}
