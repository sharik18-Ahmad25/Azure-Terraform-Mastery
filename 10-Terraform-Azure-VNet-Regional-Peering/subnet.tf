# Subnet for Hub VNet
resource "azurerm_subnet" "subnet_hub" {
  name = "snet-hub-mgmt"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet_a.name
  address_prefixes     = ["10.1.1.0/24"]
}
  
# Subnet for Spoke VNet
resource "azurerm_subnet" "subnet_spoke" {
  name                 = "snet-spoke-app"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet_b.name
  address_prefixes     = ["10.2.1.0/24"]
}