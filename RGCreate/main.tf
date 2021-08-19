terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      version = "~>2.0"
      source  = "hashicorp/azurerm"
    }
  }

  #Backend to store terraform state file
  #backend "azurerm" {
  #  resource_group_name  = "lab-rg1"
  #  storage_account_name = "kiransaforazurelab"
  #  container_name       = "tfstate"
  #  key                  = "terraform.tfstate"
  #}
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
    name = var.rg_name
    location = var.rg_loc
}

output "account_id" {
  value = data.azurerm_client_config.current.client_id
}

output "tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}

output "rg_id" {
  value = data.azurerm_resource_group.rg.id
}
