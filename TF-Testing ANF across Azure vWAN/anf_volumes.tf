# Create Azure NetApp Files NFS Volume 1
resource "azurerm_netapp_volume" "anf_nfs_vol_1" {
  lifecycle {
    prevent_destroy = false
  }

  name                = "vol-nfs-${var.region1}"
  location            = azurerm_resource_group.region1-rg1.location
  resource_group_name = azurerm_resource_group.region1-rg1.name
  account_name        = azurerm_netapp_account.anf_acc_1.name
  pool_name           = azurerm_netapp_pool.anf_cap_1.name
  volume_path         = "${var.region1}-${var.vol_path_nfs}"
  service_level       = var.service_level_std
  subnet_id           = azurerm_subnet.region1-vnet1-snet2.id
  protocols           = [var.protocol_nfs]
  storage_quota_in_gb = var.volume_size

  export_policy_rule {
    rule_index          = 1
    allowed_clients     = ["0.0.0.0/0"]
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

# Create Azure NetApp Files NFS Volume 2
resource "azurerm_netapp_volume" "anf_nfs_vol_2" {
  lifecycle {
    prevent_destroy = false
  }

  name                = "vol-nfs-${var.region2}"
  location            = azurerm_resource_group.region2-rg1.location
  resource_group_name = azurerm_resource_group.region2-rg1.name
  account_name        = azurerm_netapp_account.anf_acc_2.name
  pool_name           = azurerm_netapp_pool.anf_cap_2.name
  volume_path         = "${var.region2}-${var.vol_path_nfs}"
  service_level       = var.service_level_std
  subnet_id           = azurerm_subnet.region2-vnet1-snet2.id
  protocols           = [var.protocol_nfs]
  storage_quota_in_gb = var.volume_size

  export_policy_rule {
    rule_index          = 1
    allowed_clients     = ["0.0.0.0/0"]
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

