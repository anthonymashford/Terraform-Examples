# Create Azure NetApp Files Capacity Pool 1
resource "azurerm_netapp_pool" "anf_cap_1" {
  name                = "cap-${var.region_1}-${random_string.rg_random_1.result}"
  account_name        = azurerm_netapp_account.anf_acc_1.name
  location            = var.region_1
  resource_group_name = azurerm_resource_group.rg_1.name
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