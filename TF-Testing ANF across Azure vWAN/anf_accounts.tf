# Create Azure NetApp Files Account 1
resource "azurerm_netapp_account" "anf_acc_1" {
  name                = "anf-Lab-${var.region1}-${random_string.random.result}"
  resource_group_name = azurerm_resource_group.region1-rg1.name
  location            = azurerm_resource_group.region1-rg1.location

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }

}

# Create Azure NetApp Files Account 2
resource "azurerm_netapp_account" "anf_acc_2" {
  name                = "anf-Lab-${var.region2}-${random_string.random.result}"
  resource_group_name = azurerm_resource_group.region2-rg1.name
  location            = azurerm_resource_group.region2-rg1.location

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }

}