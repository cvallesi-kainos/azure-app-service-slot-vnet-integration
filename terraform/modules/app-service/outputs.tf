output "app_id" {
  value = azurerm_linux_web_app.web_app.id
}

output "app_hostname" {
  value = azurerm_linux_web_app.web_app.default_hostname
}
