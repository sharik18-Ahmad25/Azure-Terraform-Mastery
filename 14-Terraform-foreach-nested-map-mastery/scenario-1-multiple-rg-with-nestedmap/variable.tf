variable "environment_configuration" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))
  description = "Map of Objects containing environment specific Resource Group details"
}