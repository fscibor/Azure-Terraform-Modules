# Create a Virtual Network (VNet)
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.region}-vnet"
  address_space       = [var.ip_range]
  location            = var.region
  resource_group_name = azurerm_resource_group.RegionalProduction_RG.name

  tags = {
    name = "${var.region}-vnet"
    location = var.region
  }
}

# Create a Subnet within the Virtual Network
resource "azurerm_subnet" "subnet" {
  name                 = "${var.region}-subnet"
  resource_group_name   = azurerm_resource_group.RegionalProduction_RG.name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = [var.ip_subnet]
   delegation {
    name = "appServiceDelegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}


# Assign the Web App to the VNet
resource "azurerm_app_service_virtual_network_swift_connection" "vnet_connection" {
  app_service_id    = azurerm_linux_web_app.app_server.id
  subnet_id         = azurerm_subnet.subnet.id
}