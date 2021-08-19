terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      version = "~>2.0"
      source  = "hashicorp/azurerm"
    }

    randome = {
      version = ">= 3.0"
      source  = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

data "azurerm_client_config" "current" {
}

resource "random_string" "random" {
  length  = 10
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  name                     = "kiransa${random_string.random.id}"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.acc_tier
  account_replication_type = var.rep_type

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.cntnr_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.access_type
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

output "sa_id" {
  value = azurerm_storage_account.sa.id
}

output "sa_name" {
  value = azurerm_storage_account.sa.name
}

output "container_name" {
  value = azurerm_storage_container.tfstate.name
}
