# Create Providers
terraform {
  required_providers {
    azurerm = {
      # Specify what version of the provider we are going to utilise
      source        = "hashicorp/azurerm"
      version       = ">= 3.0.2"
    }
    random = {
      source        = "hashicorp/random"
      version       = "3.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}