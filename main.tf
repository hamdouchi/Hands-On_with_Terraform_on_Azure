terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {
    organization = "TerraformAzureCap"
    workspaces {
      name = "hands-On_with_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-6406d9d3-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "securestorage" {
  source               = "app.terraform.io/TerraformAzureCap/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "sacapmarocazhar25"
  environment          = "Production"
}
