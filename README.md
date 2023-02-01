<!-- BEGIN_TF_DOCS -->

# Azure Route Table module

## Examples
```hcl
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
```

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Id of route table. |
| <a name="output_name"></a> [name](#output\_name) | Name of route table. |
| <a name="output_object"></a> [object](#output\_object) | Object of route table. |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | (Required)The location to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required)A container that holds related resources for an Azure solution. | `string` | n/a | yes |
| <a name="input_route_table_name"></a> [route\_table\_name](#input\_route\_table\_name) | (Required)Name of route table to create. | `string` | n/a | yes |
| <a name="input_disable_bgp_route_propagation"></a> [disable\_bgp\_route\_propagation](#input\_disable\_bgp\_route\_propagation) | (Optional)Choose if you want to disable bgp route propagation. | `bool` | `true` | no |
| <a name="input_route_tables"></a> [route\_tables](#input\_route\_tables) | (Optional)List of routes to apply to subnet. | <pre>list(object({<br>    name                   = string<br>    address_prefix         = string<br>    next_hop_type          = string<br>    next_hop_in_ip_address = optional(string)<br>  }))</pre> | `[]` | no |



# Authors
Originally created by Omer Brumer
<!-- END_TF_DOCS -->