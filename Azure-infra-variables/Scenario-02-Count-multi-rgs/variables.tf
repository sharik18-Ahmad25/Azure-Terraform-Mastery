variable "rg_names" {
    type = list(string)
description = "List of 5 Resource Group names"  
default = [ "kkr-rg1","kkr-rg2","kkr-rg3","kkr-rg4","kkr-rg5" ]
}

variable "location" {
    type = string
    default = "east us"
  
}