# Azure NIC and Public IP Deployment using Terraform

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform)
![Azure](https://img.shields.io/badge/Azure-Cloud-0078D4?style=for-the-badge&logo=microsoftazure)
![Networking](https://img.shields.io/badge/Azure-Networking-0A66C2?style=for-the-badge&logo=azuredevops)
![Infrastructure](https://img.shields.io/badge/Infrastructure-as%20Code-blue?style=for-the-badge)
![Public IP](https://img.shields.io/badge/Public-IP_Configuration-green?style=for-the-badge)
![NIC](https://img.shields.io/badge/Network-Interface-orange?style=for-the-badge)
![Cloud Lab](https://img.shields.io/badge/Project-Hands--On_Lab-purple?style=for-the-badge)
![Beginner Friendly](https://img.shields.io/badge/Level-Beginner--Friendly-brightgreen?style=for-the-badge)

---

## Core Concepts (In Simple Words)

### 1. What is a Public IP?

A **Public IP** is like your home's unique mailing address that the whole world can see. In the cloud, if you want your Virtual Machine (VM) to talk to the internet, or if you want to access your VM from your laptop, you need a Public IP.

---

### 2. What is a NIC (Network Interface Card)?

A **NIC** is like the physical Ethernet port or Wi-Fi card on your laptop. It is a piece of virtual hardware that connects a Virtual Machine to a network. A VM cannot talk to any network without a NIC.

---

### 3. Why do we need a NIC?

A Virtual Machine cannot directly hold an IP address. The IP address (both Private and Public) is always assigned to the **NIC**, and then that NIC is attached to the VM. Think of the NIC as the bridge between your VM and your network.

---

### 4. Why do we link NIC and Public IP?

By default, a NIC only gets a local Private IP from your Subnet (which means it can only talk to other resources inside that network). To make it accessible from the outside world, we map (or bind) a Public IP onto that NIC. This allows internet traffic to reach the local network interface safely.

---

## Code Breakdown (Block-by-Block Explanation)

**Here is the exact logic behind why every resource and configuration block was created in this lab**:

### 1. Resource Group
```bash
resource "azurerm_resource_group" "rg" {
  name     = "rg-azure-nic-public-ip-lab"
  location = "East US"
}
```
---

### Why we built it:

It acts as a logical container. Every Azure resource must live inside a Resource Group so we can manage and delete them together easily.

---

### 2. Virtual Network (VNet)
```bash
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-nic-lab"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}
```
---

### Why we built it:

This is your isolated private network space inside Azure. We need this because a NIC cannot exist in a vacuum; it requires a private network layout first.

---

### 3. Subnet
```bash
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-nic-lab"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
```
---

### Why we built it: 

A VNet is too big. A Subnet slices that VNet into smaller sections. The NIC requires a specific subnet ID to sit inside and fetch its internal private IP address.

---

### 4. Public IP
```bash
resource "azurerm_public_ip" "pip" {
  name                = "pip-lab"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}
```
---

### Why sku = "Standard"? 

Azure has deprecated the older "Basic" SKU. Modern Azure standards enforce the "Standard" SKU for production-ready, secure Public IPs.

---

### Why allocation_method = "Static"?

 Azure architectural rules mandate that if you choose a Standard SKU, the allocation method must be set to Static. This ensures your public facing IP address doesn't randomly change on you.

 ---

 ### 5. Network Interface (NIC)
 ```bash
 resource "azurerm_network_interface" "nic" {
  name                = "nic-lab"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "internal-config"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}
```
---

### Why subnet_id?

Tells the NIC which specific sub-network it belongs to.

---

### Why private_ip_address_allocation = "Dynamic"? 

We let Azure automatically pick and assign any available private IP from our subnet pool (e.g., 10.0.1.4) instead of us hardcoding it manually. Note that the capital "D" in Dynamic is syntactically required by the Terraform provider.

---

### Why public_ip_address_id?

This is where the magic binding happens. It attaches our newly created Public IP directly onto this NIC interface, exposing its configuration to public traffic.

---

## How to Run This Lab

**1 Initialize the project providers**:

```Bash
   terraform init
   ```
   ---

 **2 Verify the structural resources to be created**:

```Bash
   terraform plan
   ```
   ---
  **3 Deploy the infrastructure to Azure**:

```Bash
   terraform apply --auto-approve
   ```
   ---

---

## 🚀 Key Takeaways

* **Standard SKU Constraint:** Azure strictly mandates `Static` allocation for `Standard` SKU Public IPs. Using `Dynamic` triggers an API 400 Bad Request.

* **Case Sensitivity:** The `private_ip_address_allocation` argument is strictly case-sensitive. It must be capitalized as `"Dynamic"`; lowercase causes Terraform to fail with a missing IP error.

* **Clean Lifecycle:** Bundling the VNet, Subnet, NIC, and Public IP inside a single dedicated Resource Group ensures `terraform destroy` cleanly wipes the entire sandbox without leaving orphaned resources.   

---