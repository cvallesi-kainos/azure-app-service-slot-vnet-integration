terraform {
  required_version = ">= 1.3.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.28.0"
    }
  }
}

provider "azurerm" {
  features {
    template_deployment {
      delete_nested_items_during_deletion = true
    }
  }
}