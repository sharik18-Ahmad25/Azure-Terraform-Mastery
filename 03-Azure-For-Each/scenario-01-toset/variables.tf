variable "rg_name" {
    type = list(string)
    default = [ "prod-rg","dev-rg" ]

}

variable "location" {
    type = string
    default = "east us"
  
}

