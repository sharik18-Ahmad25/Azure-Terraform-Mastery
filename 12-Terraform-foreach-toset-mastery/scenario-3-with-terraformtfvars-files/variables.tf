variable "rg_names" {
  type        = list(string)
  description = "List of Resource Group names"
  # we did not give any default value here

}

variable "location" {
  type        = string
  description = "location of rgs"
  #  we did not give any default value here
}