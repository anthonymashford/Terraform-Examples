# Resource Groups vWAN - Region 1
resource "azurerm_resource_group" "region1-rg1" {
  name     = "rg-${var.lab-name}-${var.region1}-${random_string.random.result}"
  location = var.region1
  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}
# Resource Groups vWAN - Region 2
resource "azurerm_resource_group" "region2-rg1" {
  name     = "rg-${var.lab-name}-${var.region2}-${random_string.random.result}"
  location = var.region2
  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}