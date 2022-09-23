# Create Azure NetApp Files Capacity Pool 1
resource "azurerm_netapp_pool" "anf_cap_1" {
  name                = "cap-Lab-${var.region1}"
  account_name        = azurerm_netapp_account.anf_acc_1.name
  location            = azurerm_resource_group.region1-rg1.location
  resource_group_name = azurerm_resource_group.region1-rg1.name
  service_level       = var.cap_pool_tier
  size_in_tb          = var.cap_pool_size
  qos_type            = var.qos_type

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}

# Create Azure NetApp Files Capacity Pool 2
resource "azurerm_netapp_pool" "anf_cap_2" {
  name                = "cap-Lab-${var.region2}"
  account_name        = azurerm_netapp_account.anf_acc_2.name
  location            = azurerm_resource_group.region2-rg1.location
  resource_group_name = azurerm_resource_group.region2-rg1.name
  service_level       = var.cap_pool_tier
  size_in_tb          = var.cap_pool_size
  qos_type            = var.qos_type

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}