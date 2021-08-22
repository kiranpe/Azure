variable "rg_name" {
  default = "kiranRG"
}

variable "loc" {
  default = "eastus"
}

variable "vnet_name" {
  default = "kiranVNet"
}

variable "vnet_range" {
  default = ["10.0.0.0/16"]
}

variable "snet_name" {
  default = "kiranSNet"
}

variable "snet_range" {
  default = ["10.0.2.0/24"]
}

variable "ip_name" {
  default = "kiranIP"
}

variable "ip_method" {
  default = "Static"
}

variable "nwi_name" {
  default = "kiranNWI"
}

variable "nwi_ip_config_name" {
  default = "internal"
}

variable "nwi_private_ip_alloc" {
  default = "Dynamic"
}
