
# Create a Storage Account
resource "azurerm_storage_account" "production_data" {
  name                     = "${var.region}${var.storage}"
  resource_group_name       = azurerm_resource_group.RegionalProduction_RG.name
  location                  = var.region
  account_tier              = "Standard"
  account_replication_type  = "LRS"

  tags = {
    name = "${var.region}-${var.storage}"
    location     = var.region
  }
}