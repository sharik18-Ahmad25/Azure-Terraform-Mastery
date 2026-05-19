variable "rg_environments" {
  type        = map(string)
  description = "Map of environments where Key = RG Name and Value = Azure Region"
  default = {
    "sharik-dev-rg"   = "East US"
    "sharik-stage-rg" = "Central US"
    "sharik-prod-rg"  = "West US"
  }

}