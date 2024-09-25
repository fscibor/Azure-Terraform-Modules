Following Project is designed to work with Terraform Local Modules. The purpose is to create:

Azure Resource Group with name defined by the provided region at Root Module. 
That has been described by following code: "${var.region}-ResourceGroup". The rest of resources below are the part of this resource group with apropriate tags:
1.App Service Plan
2.Linux Web App 
3.Storage Account
4.Vnet
5.Subnet

In general this configuration:
Creates a Virtual Network (VNet) with a specified IP range.
Creates a subnet within that VNet, delegating it for use with App Service.
Connects an existing Linux Web App to the VNet by assigning it to the subnet.

