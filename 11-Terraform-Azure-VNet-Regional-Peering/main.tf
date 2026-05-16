# 1. PROVIDERS CONFIGURATION
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Default Provider (For East US) 
provider "azurerm" {
  features {}
}

# Alias Provider (FOr West Europe - Same Subscription)
provider "azurerm" {
  alias   = "europe"
  features {}
}


# 2. REGION 1 RESOURCES (East US - Default)

resource "azurerm_resource_group" "rg_east" {
  name     = "rg-global-eastus"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet_east" {
  name                = "vnet-eastus"
  resource_group_name = azurerm_resource_group.rg_east.name
  location            = azurerm_resource_group.rg_east.location
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet_east" {
  name                 = "subnet-eastus"
  resource_group_name  = azurerm_resource_group.rg_east.name
  virtual_network_name = azurerm_virtual_network.vnet_east.name
  address_prefixes     = ["10.1.1.0/24"]
}

# NSG for East US - Inbound ICMP (Ping) aur SSH allow karne ke liye
resource "azurerm_network_security_group" "nsg_east" {
  name                = "nsg-eastus"
  location            = azurerm_resource_group.rg_east.location
  resource_group_name = azurerm_resource_group.rg_east.name

  security_rule {
    name                       = "Allow-Ping-From-WestEurope"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.2.0.0/16" # Europe ka network space
    destination_address_prefix = "10.1.0.0/16"
  }

  security_rule {
    name                       = "Allow-SSH-All"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Subnet aur NSG ko link karna (East US)
resource "azurerm_subnet_network_security_group_association" "nsg_assoc_east" {
  subnet_id                 = azurerm_subnet.subnet_east.id
  network_security_group_id = azurerm_network_security_group.nsg_east.id
}

resource "azurerm_public_ip" "pip_east" {
  name                = "pip-vm-eastus"
  location            = azurerm_resource_group.rg_east.location
  resource_group_name = azurerm_resource_group.rg_east.name
  allocation_method   = "Static"   
  sku                 = "Standard" 
}
resource "azurerm_network_interface" "nic_east" {
  name                = "nic-vm-eastus"
  location            = azurerm_resource_group.rg_east.location
  resource_group_name = azurerm_resource_group.rg_east.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_east.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_east.id
  }
}

resource "azurerm_linux_virtual_machine" "vm_east" {
  name                = "vm-eastus"
  resource_group_name = azurerm_resource_group.rg_east.name
  location            = azurerm_resource_group.rg_east.location
  size                = "Standard_DC1ds_v3"
  admin_username      = "azureuser"
  admin_password      = var.admin_password # Variable use kiya yahan
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nic_east.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}


# ==========================================
# 3. REGION 2 RESOURCES (West Europe - Alias)
# ==========================================

resource "azurerm_resource_group" "rg_west" {
  provider = azurerm.europe
  name     = "rg-global-westeurope"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet_west" {
  provider            = azurerm.europe
  name                = "vnet-westeurope"
  resource_group_name = azurerm_resource_group.rg_west.name
  location            = azurerm_resource_group.rg_west.location
  address_space       = ["10.2.0.0/16"]
}

resource "azurerm_subnet" "subnet_west" {
  provider             = azurerm.europe
  name                 = "subnet-westeurope"
  resource_group_name  = azurerm_resource_group.rg_west.name
  virtual_network_name = azurerm_virtual_network.vnet_west.name
  address_prefixes     = ["10.2.1.0/24"]
}

# NSG for West Europe
resource "azurerm_network_security_group" "nsg_west" {
  provider            = azurerm.europe
  name                = "nsg-westeurope"
  location            = azurerm_resource_group.rg_west.location
  resource_group_name = azurerm_resource_group.rg_west.name

  security_rule {
    name                       = "Allow-Ping-From-EastUS"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.1.0.0/16" # East US ka network space
    destination_address_prefix = "10.2.0.0/16"
  }

  security_rule {
    name                       = "Allow-SSH-All"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Subnet aur NSG ko link karna (West Europe)
resource "azurerm_subnet_network_security_group_association" "nsg_assoc_west" {
  provider                  = azurerm.europe
  subnet_id                 = azurerm_subnet.subnet_west.id
  network_security_group_id = azurerm_network_security_group.nsg_west.id
}

resource "azurerm_network_interface" "nic_west" {
  provider            = azurerm.europe
  name                = "nic-vm-westeurope"
  location            = azurerm_resource_group.rg_west.location
  resource_group_name = azurerm_resource_group.rg_west.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_west.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm_west" {
  provider            = azurerm.europe
  name                = "vm-westeurope"
  resource_group_name = azurerm_resource_group.rg_west.name
  location            = azurerm_resource_group.rg_west.location
  size                = "Standard_DC1ds_v3"
  admin_username      = "azureuser"
  admin_password      = var.admin_password # Variable use kiya yahan
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nic_west.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}


# ==========================================
# 4. GLOBAL VNET PEERING (The Connections)
# ==========================================

resource "azurerm_virtual_network_peering" "east_to_west" {
  name                      = "peering-east-to-west"
  resource_group_name       = azurerm_resource_group.rg_east.name
  virtual_network_name      = azurerm_virtual_network.vnet_east.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_west.id
}

resource "azurerm_virtual_network_peering" "west_to_east" {
  provider                  = azurerm.europe
  name                      = "peering-west-to-east"
  resource_group_name       = azurerm_resource_group.rg_west.name
  virtual_network_name      = azurerm_virtual_network.vnet_west.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_east.id
}