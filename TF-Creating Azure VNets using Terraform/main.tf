terraform {
  required_providers {
    azurerm = {
      # Specify what version of the provider we are going to utilise.
      source        = "hashicorp/azurerm"
      version       = ">= 2.90.0"
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

# Create random string - This will create a random character string to be used for naming of resources
resource "random_string" "rg_random_1" {
  length  = 4
  special = false
}

# Create random string - This will create a random character string to be used for naming of resources
resource "random_string" "rg_random_2" {
  length  = 4
  special = false
}

# Create Resource Group 1
resource "azurerm_resource_group" "rg_1" {
  name     =  "${var.rg_name_1}-${var.region_1}-${random_string.rg_random_1.result}"
  location = var.region_1
  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
  }
}

# Create Resource Group 2
resource "azurerm_resource_group" "rg_2" {
  name     =  "${var.rg_name_2}--${var.region_2}-${random_string.rg_random_2.result}"
  location = var.region_2
  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
  }
}