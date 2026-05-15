variable "resource_group_name" {
  default = "rg-vnet-peering-lab"
}

variable "location" {
  default = "Central India"
}

variable "vnet_hub_cidr" {
  default = ["10.1.0.0/16"]
}

variable "vnet_spoke_cidr" {
  default = ["10.2.0.0/16"]
}

variable "admin_password" {
  description = "Password for the VMs"
  type        = string
  sensitive   = true 
}