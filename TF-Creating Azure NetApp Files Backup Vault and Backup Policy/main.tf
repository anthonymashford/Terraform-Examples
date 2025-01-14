provider "azurerm" {
  features {}
  # You will need to add your subscription_id here
  subscription_id = "<<Add your sudID here>>"
}

resource "azurerm_resource_group" "rg-bkuplab" {
  name     = "rg-anf-weu-bkuplab"
  location = "West Europe"
}

resource "azurerm_virtual_network" "rg-bkuplab" {
  name                = "vnet-anf-weu-bkuplab"
  address_space       = ["172.16.0.0/16"]
  location            = azurerm_resource_group.rg-bkuplab.location
  resource_group_name = azurerm_resource_group.rg-bkuplab.name
}

resource "azurerm_subnet" "anf_subnet" {
  name                 = "subnet-anf"
  resource_group_name  = azurerm_resource_group.rg-bkuplab.name
  virtual_network_name = azurerm_virtual_network.rg-bkuplab.name
  address_prefixes     = ["172.16.1.0/24"]

  delegation {
    name = "netapp"

    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_netapp_account" "anf-account" {
  name                = "anf-account"
  location            = azurerm_resource_group.rg-bkuplab.location
  resource_group_name = azurerm_resource_group.rg-bkuplab.name
  tags = {
    environment = "bkuplab"
  }
}

resource "azurerm_netapp_snapshot_policy" "anf-snapshot-policy" {
  name                = "anf-snapshot-policy"
  location            = azurerm_resource_group.rg-bkuplab.location
  resource_group_name = azurerm_resource_group.rg-bkuplab.name
  account_name        = azurerm_netapp_account.anf-account.name
  enabled             = true

  hourly_schedule {
    minute            = 0
    snapshots_to_keep = 1
  }

  daily_schedule {
    minute            = 15
    hour              = 01
    snapshots_to_keep = 7
  }

  weekly_schedule {
    minute            = 30
    hour              = 01
    days_of_week      = ["Sunday"]
    snapshots_to_keep = 4
    }

  monthly_schedule {
    minute            = 45
    hour              = 01
    days_of_month     = [1]
    snapshots_to_keep = 12
    }
  
}

resource "azurerm_netapp_backup_policy" "anf-backup-policy" {
  name                = "anf-backup-policy"
  location            = azurerm_resource_group.rg-bkuplab.location
  resource_group_name = azurerm_resource_group.rg-bkuplab.name
  account_name        = azurerm_netapp_account.anf-account.name

  enabled                 = true
  daily_backups_to_keep   = 7
  weekly_backups_to_keep  = 4
  monthly_backups_to_keep = 12
}

resource "azurerm_netapp_backup_vault" "anf-backup-vault" {
  name                = "anf-backup-vault"
  location            = azurerm_resource_group.rg-bkuplab.location
  resource_group_name = azurerm_resource_group.rg-bkuplab.name
  account_name        = azurerm_netapp_account.anf-account.name
}

resource "azurerm_netapp_pool" "anf-pool" {
  name                = "anf-pool"
  location            = azurerm_resource_group.rg-bkuplab.location
  resource_group_name = azurerm_resource_group.rg-bkuplab.name
  account_name        = azurerm_netapp_account.anf-account.name
  size_in_tb          = 4
  service_level       = "Standard"
}

resource "azurerm_netapp_volume" "anf-vol" {
  name                = "anf-vol"
  location            = azurerm_resource_group.rg-bkuplab.location
  resource_group_name = azurerm_resource_group.rg-bkuplab.name
  account_name        = azurerm_netapp_account.anf-account.name
  pool_name           = azurerm_netapp_pool.anf-pool.name
  subnet_id           = azurerm_subnet.anf_subnet.id
  volume_path         = "bkuplab"
  service_level       = "Standard"
  storage_quota_in_gb = 100
  data_protection_snapshot_policy {
    snapshot_policy_id = azurerm_netapp_snapshot_policy.anf-snapshot-policy.id
  }

    data_protection_backup_policy {
        backup_vault_id = azurerm_netapp_backup_vault.anf-backup-vault.id
        backup_policy_id = azurerm_netapp_backup_policy.anf-backup-policy.id
        policy_enabled = true   
    }

  lifecycle {
    prevent_destroy = true
  }
}
