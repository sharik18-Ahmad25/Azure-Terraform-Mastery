resource "azurerm_resource_group" "prod_rg" {
  name     = "sharik-prod-critical-rg"
  location = "East US"

  # Accidental Deletion Protection: Enforces strict infrastructure state locking
  lifecycle {
    prevent_destroy = true
  }
}