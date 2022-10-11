resource "azurerm_virtual_network" "network" {
  name                = format("%s-example-virtual-network", var.prefix)
  address_space       = ["10.0.0.0/16"]
  resource_group_name = local.resource_group_name
  location            = var.location
}

resource "azurerm_subnet" "subnetwork" {
  name                 = format("%s-example-subnet", var.prefix)
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = format("%s-example-delegation", var.prefix)

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}
