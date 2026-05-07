# 1. Provider Setup
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# 2. Resource Group
resource "azurerm_resource_group" "beginner_rg" {
  name     = "rg-beginner-project"
  location = "East US"
}

# 3. Virtual Network (Hardcoded for clarity)
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-simple-learning"
  resource_group_name = azurerm_resource_group.beginner_rg.name
  location            = azurerm_resource_group.beginner_rg.location
  address_space       = ["10.0.0.0/16"]
}

# 4. Web Subnet (Hardcoded for clarity)
resource "azurerm_subnet" "web" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.beginner_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# 5. DB Subnet (Hardcoded for clarity)
resource "azurerm_subnet" "db" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.beginner_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}