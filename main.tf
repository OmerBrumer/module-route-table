/**
* # Azure Route Table module
*/

resource "azurerm_route_table" "configuration" {
  name                          = var.route_table_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  disable_bgp_route_propagation = var.disable_bgp_route_propagation

  dynamic "route" {
    for_each = var.route_tables

    content {
      name                   = route.value["name"]
      address_prefix         = route.value["address_prefix"]
      next_hop_type          = route.value["next_hop_type"]
      next_hop_in_ip_address = route.value["next_hop_in_ip_address"]
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}