#Resource Group Variables

variable "myrg_name" {
  description = "My Resource Group Name"
  type        = string
  default     = "kiranRG"
}

variable "myrg_loc" {
  description = "My Resoure Group Location"
  type        = string
  default     = "eastus"
}

#Security Group Variables

variable "create_sec_grp" {
  description = "Create Security Group or Not"
  type        = string
  default     = "true"
}

variable "sec_grp_name" {
  description = "Scurity Group Name"
  type        = string
  default     = "kiranSecGrp"
}

variable "sec_ingress" {
  description = "List of Security Group Ingress Rules"
  type        = list

  default = [
      # [name, priority, direction, access, protocol, destination_port_ranges, source_address_prefix, destination_address_prefix]
      ["AllowHttpsInbound", "120", "Inbound", "Allow", "Tcp", "443", "Internet", "*"],
      ["AllowLinuxSSHInbound", "130", "Inbound", "Allow", "Tcp", "22", "*", "*"],
      ["AllowWindowsSSHInbound", "140", "Inbound", "Allow", "Tcp", "3389", "*", "*"],
      ["AllowHttpInbound", "110", "Inbound", "Allow", "Tcp", "80", "Internet", "*"],
      ["AllowBastionHostCommunication", "150", "Inbound", "Allow", "Tcp", "8080", "VirtualNetwork", "VirtualNetwork"]
  ]
}
