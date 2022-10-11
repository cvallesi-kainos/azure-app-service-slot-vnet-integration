resource "azurerm_service_plan" "app_service" {
  name                = format("%s-example-app-plan", var.prefix)
  resource_group_name = local.resource_group_name
  location            = var.location
  sku_name            = var.app_plan_sku
  os_type             = "Linux"
}

resource "azurerm_linux_web_app" "web_app" {
  name                = format("%s-example-app", var.prefix)
  resource_group_name = local.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.app_service.id

  site_config {
    vnet_route_all_enabled = true
  }
}

resource "azurerm_linux_web_app_slot" "slot_stage" {
  name           = format("%s-example-slot", var.prefix)
  app_service_id = azurerm_linux_web_app.web_app.id

  site_config {
    vnet_route_all_enabled = true
  }
}

# resource "azurerm_web_app_active_slot" "active_slot" {
#   slot_id = azurerm_linux_web_app_slot.slot_stage.id
# }

resource "azurerm_app_service_virtual_network_swift_connection" "swift_connection" {
  app_service_id = azurerm_linux_web_app.web_app.id
  subnet_id      = data.azurerm_subnet.subnetwork.id
}