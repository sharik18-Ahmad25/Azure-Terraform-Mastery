# ==========================================
# 1. PROVIDER CONFIGURATION
# ==========================================
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

# ==========================================
# 2. DATA BLOCKS (Fetching Key Vault & Secret)
# ==========================================
data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

data "azurerm_key_vault_secret" "vmpass" {
  name         = var.secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

# ==========================================
# 3. RESOURCE GROUP
# ==========================================
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# ==========================================
# 4. NETWORKING (VNET & SUBNET)
# ==========================================
resource "azurerm_virtual_network" "vnet" {
  name                = "sharik-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "internal-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# ==========================================
# 5. PUBLIC IP & SECURITY (NSG)
# ==========================================
resource "azurerm_public_ip" "pip" {
  name                = "sharik-linux-pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "sharik-vm-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# ==========================================
# 6. NETWORK INTERFACE (NIC)
# ==========================================
resource "azurerm_network_interface" "nic" {
  name                = "linux-vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# ==========================================
# 7. LINUX VIRTUAL MACHINE
# ==========================================
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "sharik-linux-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_DC1ds_v3"
  admin_username      = "sharikadmin"
  
  # Using Secret from Key Vault
  admin_password                  = data.azurerm_key_vault_secret.vmpass.value
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

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

# Output for SSH
output "public_ip" {
  value = azurerm_public_ip.pip.ip_address
}