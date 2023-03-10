terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      // version = "=2.46.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "sttfstatedevwestus201"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
