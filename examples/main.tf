module "route_table" {
  source = "../../route_table"

  route_table_name    = "brumer-final-terraform-hub-firewall-routetable"
  resource_group_name = "brumer-final-terraform-hub-rg"
  location            = "West-Europe"
  route_tables = jsondecode(templatefile("./routes/hub_routes.json", {
    workspoke_main_subnet_address_prefix = "10.1.0.0/24"
    monitorspoke_subnet_address_prefix   = "10.2.0.0/24"
    firewall_private_ip_address          = "10.0.1.4"
  }))
}