variable "resource_group_name" {
  description = "Name of the resource group for VM"
  default     = "sharik-rg"
}

variable "location" {
  description = "Azure region"
  default     = "East US"
}

variable "kv_name" {
  description = "Name of the existing Key Vault"
  default     = "sharik-kv1"
}

variable "kv_rg_name" {
  description = "Resource group where Key Vault is located"
  default     = "sharik-rg" 
}

variable "secret_name" {
  description = "Name of the secret in Key Vault"
  default     = "vm-pswrd"
}