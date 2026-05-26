# 1. Azure Provider Configuration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# 2. Creating a Resource Group (“**The data whose output we will display**”)
resource "azurerm_resource_group" "sharik_rg" {
  name     = "sharik-practice-outputs-rg"
  location = "East US"
  
  tags = {
    Environment = "Lab-Testing"
    Owner       = "Sharik"
  }
}

# TYPE 1: Simple Output (A single attribute of a cloud resource)

output "rg_id" {
  value       = azurerm_resource_group.sharik_rg.id
  description = "The subscription ID and full path of the Resource Group."
}

# TYPE 2: Complex Output (Wrapping multiple details into a map/bundle)

output "rg_full_details" {
  value = {
    rg_name     = azurerm_resource_group.sharik_rg.name
    rg_location = azurerm_resource_group.sharik_rg.location
    rg_tags     = azurerm_resource_group.sharik_rg.tags
  }
  description = "A complex map output containing all metadata of the RG."
}

# TYPE 3: Sensitive Output (Security checking)
# **Suppose we are outputting some production string or secret**

output "rg_secret_token" {
  value       = "secret-token-for-rg-${azurerm_resource_group.sharik_rg.name}"
  sensitive   = true
  description = "A sensitive string that should not be visible in terminal logs."
}