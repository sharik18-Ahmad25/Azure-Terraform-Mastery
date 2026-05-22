# 1. Terraform Settings aur Azure Provider Configuration
terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.73.0"
    }
  }
}
provider "azurerm" {
    features {
      
    }
  
}

# 2. Local Variables (Here we have simply put all the ports into a single list)

locals {
  resource_group_name = "rg-sharik-nsg-lab"
  location = "East US"
  nsg_name            = "nsg-dynamic-ports-prod"
  
# You can simply add or remove any port in this list depending on which ports you want to open.

  ports_to_open       = ["22", "80", "443", "8080", "3000"]
}

# 3. Azure Resource Group Creation
resource "azurerm_resource_group" "nsg_rg" {
  
  name = local.resource_group_name
  location = local.location
}

# 4. Network Security Group Deployment with Dynamic Block
resource "azurerm_network_security_group" "app_nsg" {
    name = local.nsg_name
    resource_group_name = azurerm_resource_group.nsg_rg.name
    location = azurerm_resource_group.nsg_rg.location
  
# This dynamic block will run a loop over our list of ports.

  dynamic "security_rule" {

    for_each = local.ports_to_open
    
    content {
      name                       = "Allow-Port-${security_rule.value}"
      priority                   = 100 + index(local.ports_to_open, security_rule.value)
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    
  }

tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"

}
}

#5. Outputs (Used to print the ports on the console after deployment).

output "nsg_id" {
  value       = azurerm_network_security_group.app_nsg.id
  description = "The Resource ID of the newly created NSG"
}

output "rules_deployed" {
  value       = local.ports_to_open
}