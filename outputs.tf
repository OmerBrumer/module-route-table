output "id" {
  description = "Id of route table."
  value       = azurerm_route_table.configuration.id
}

output "name" {
  description = "Name of route table."
  value       = azurerm_route_table.configuration.name
}

output "object" {
  description = "Object of route table."
  value       = azurerm_route_table.configuration
}