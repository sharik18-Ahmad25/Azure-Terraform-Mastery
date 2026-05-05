variable "name_rg" {
    type = map(string)
    default = {
      "hr-rg" = "east us"
      "sales-rg" = "west us"
    }
}