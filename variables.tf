variable "resource_group_name" {
  description = "(Required)A container that holds related resources for an Azure solution."
  type        = string
}

variable "location" {
  description = "(Required)The location to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'."
  type        = string
}

variable "route_table_name" {
  description = "(Required)Name of route table to create."
  type        = string
}

variable "route_tables" {
  description = "(Optional)List of routes to apply to subnet."
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  default = []
}

variable "disable_bgp_route_propagation" {
  description = "(Optional)Choose if you want to disable bgp route propagation."
  type        = bool
  default     = true
}
