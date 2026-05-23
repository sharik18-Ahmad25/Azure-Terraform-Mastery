# Resource Group 
resource "azurerm_resource_group" "rg" {
    name = "rg-azure-nic-public-ip-lab"
    location = "East Us"
  
}

# Vnet
resource "azurerm_virtual_network" "vnet" {
    name = "vnet-nic-lab"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    address_space = [ "10.0.0.0/16" ]
  
}

# Subnet 
resource "azurerm_subnet" "subnet" {
    name = "subnet-nic-lab"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["10.0.1.0/24"]
  
}

# Public Ip

resource "azurerm_public_ip" "pip" {
    name = "pip-lab"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static"
  sku = "Standard"
}

# NIC

resource "azurerm_network_interface" "nic" {
    name = "nic-lab"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location

    ip_configuration {
      name = "internal-config"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.pip.id
    }
  
}