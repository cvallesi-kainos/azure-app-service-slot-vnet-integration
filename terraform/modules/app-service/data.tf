data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_subnet" "subnetwork" {
  name                 = var.subnet_name
  virtual_network_name = var.network_name
  resource_group_name  = var.subnetwork_rg
}