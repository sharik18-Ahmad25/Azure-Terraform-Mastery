#  PUBLIC IP FOR HUB VM 
resource "azurerm_public_ip" "pip_hub" {
  name                = "pip-hub-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}


#  NETWORK INTERFACES (NICs)

# NIC for Hub VM
resource "azurerm_network_interface" "nic_hub" {
  name                = "nic-hub-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_hub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_hub.id
  }
}

# NIC for Spoke VM (Purely Private - No Public IP)
resource "azurerm_network_interface" "nic_spoke" {
  name                = "nic-spoke-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_spoke.id
    private_ip_address_allocation = "Dynamic"
  }
}


# 3. NSG TO NIC ASSOCIATION (For Activing the Ping and  SSH rules)

resource "azurerm_network_interface_security_group_association" "asoc_hub" {
  network_interface_id      = azurerm_network_interface.nic_hub.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_network_interface_security_group_association" "asoc_spoke" {
  network_interface_id      = azurerm_network_interface.nic_spoke.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


# 4. VIRTUAL MACHINES (VMs)

# Hub VM (here We will login First)
resource "azurerm_linux_virtual_machine" "vm_hub" {
  name                            = "vm-hub"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_DC1ds_v3"
  admin_username                  = "azureuser"
  admin_password                  =  var.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic_hub.id]

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

# Spoke VM (Isolated Application Server)
resource "azurerm_linux_virtual_machine" "vm_spoke" {
  name                            = "vm-spoke"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_DC1ds_v3"
  admin_username                  = "azureuser"
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic_spoke.id]

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