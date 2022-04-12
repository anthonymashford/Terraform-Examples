# Create Azure NetApp Files NFS Volume 1
resource "azurerm_netapp_volume" "anf_nfs_vol_1" {
  lifecycle {
    prevent_destroy = false
  }

  name                = "vol-nfs-${var.region_1}-${random_string.rg_random_1.result}"
  location            = var.region_1
  resource_group_name = azurerm_resource_group.rg_1.name
  account_name        = azurerm_netapp_account.anf_acc_1.name
  pool_name           = azurerm_netapp_pool.anf_cap_1.name
  volume_path         = "${var.region_1}-${var.vol_path_nfs}"
  service_level       = var.service_level_std
  subnet_id           = azurerm_subnet.vnet_1_snet_1.id
  protocols           = [var.protocol_nfs]
  storage_quota_in_gb = var.volume_size

  export_policy_rule {
    rule_index          = 1
    allowed_clients     = [var.address_vnet_1_snet_1]
    protocols_enabled   = ["NFSv3"]
    unix_read_write     = true
    root_access_enabled = true
  }

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}


/*
# Create Azure NetApp Files SMB Volume 1
resource "azurerm_netapp_volume" "anf_smb_vol_1" {
  lifecycle {
    prevent_destroy = false
  }

  name                = "vol-smb-${var.region_1}-${random_string.rg_random_1.result}"
  location            = var.region_1
  resource_group_name = azurerm_resource_group.rg_1.name
  account_name        = azurerm_netapp_account.anf_acc_1.name
  pool_name           = azurerm_netapp_pool.anf_cap_1.name
  volume_path         = "${var.region_1}-${var.vol_path_smb}"
  service_level       = var.service_level_std
  subnet_id           = azurerm_subnet.vnet_1_snet_1.id
  protocols           = [var.protocol_smb]
  storage_quota_in_gb = 1024

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}
*/