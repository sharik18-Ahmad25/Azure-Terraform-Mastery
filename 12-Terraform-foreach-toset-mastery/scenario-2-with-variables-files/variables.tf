variable "rg_names" {
    type = list(string)
    description = "List of Resource Group names to be created"
    default = [ "var-rg1","var-rg2","var-rg3" ]
  
}

variable "locations_of_rg" {
    type = string
    description = "location of each rg "
    default = "east us"
}