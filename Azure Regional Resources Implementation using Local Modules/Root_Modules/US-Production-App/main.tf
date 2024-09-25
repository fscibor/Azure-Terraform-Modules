module "eu_production" {
  source = "C:/Users/U338437/OneDrive - Danfoss/Desktop/Azure Regional Resources Implementation using Local Modules/Child_Modules"
  region = "westus"
  tier   = "Basic"
  size   = "B1"
  ip_range = "10.0.0.0/16" 
  ip_subnet = "10.0.1.0/24"
  
}