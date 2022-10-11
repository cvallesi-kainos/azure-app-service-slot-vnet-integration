output "network_name" {
  value = azurerm_virtual_network.network.name
}

output "subnetwork_name" {
  value = azurerm_subnet.subnetwork.name
}

output "subnetwork_rg" {
  value = azurerm_subnet.subnetwork.resource_group_name
}