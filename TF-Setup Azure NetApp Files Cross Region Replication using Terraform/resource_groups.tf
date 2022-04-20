# Create random string
resource "random_string" "rg_random_1" {
  length  = 4
  special = false
}

# Create Resource Group 1
resource "azurerm_resource_group" "rg_1" {
  
  name     = "rg-${var.use}-${var.region_1}-${random_string.rg_random_1.result}"
  location = var.region_1
  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}

# Create random string
resource "random_string" "rg_random_2" {
  length  = 4
  special = false
}

# Create Resource Group 2
resource "azurerm_resource_group" "rg_2" {

  name     = "rg-${var.use}-${var.region_2}-${random_string.rg_random_2.result}"
  location = var.region_2
  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}