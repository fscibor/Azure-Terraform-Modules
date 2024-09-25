
resource "azurerm_resource_group" "RegionalProduction_RG" {
  name = "${var.region}-ResourceGroup"
  location = var.region

  tags = {
    name = "${var.region}-ResourceGroup"
    location = var.region
  }
}

# Create App Service Plan
resource "azurerm_service_plan" "app_server_plan" {
  name                = "${var.region}-service-plan" 
  location            = var.region
  resource_group_name = azurerm_resource_group.RegionalProduction_RG.name
  os_type = "Linux"
  sku_name = var.size
  
}


# Create the Linux Web App
resource "azurerm_linux_web_app" "app_server" {
  name                = "${var.region}-app-server"
  location            = var.region
  resource_group_name = azurerm_resource_group.RegionalProduction_RG.name
  service_plan_id     = azurerm_service_plan.app_server_plan.id

  site_config {
    always_on = false
  }

 
}

