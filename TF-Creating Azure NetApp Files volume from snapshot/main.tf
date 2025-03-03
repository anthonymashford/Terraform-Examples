// This file contains the main code for the Terraform configuration. It will also generate a snapshot of the volume and create a new volume from the snapshot.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}

provider "azurerm" {
  // Remember to add your sub ID below
  subscription_id = "PLEASE ADD YOUR SUD ID HERE"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.region
  tags = {
    Environment = var.tags_environment
    CreatedBy   = var.tags_created_by
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
  dns_servers         = var.vnet_dns_servers
  tags = {
    Environment = var.tags_environment
    CreatedBy   = var.tags_created_by
  }

}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes

  delegation {
    name = var.delegation_name
    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }

}

resource "azurerm_netapp_account" "anf_account" {
  name                = var.anf_account_name
  location            = var.region
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    Environment = var.tags_environment
    CreatedBy   = var.tags_created_by
  }

}

resource "azurerm_netapp_pool" "anf_pool" {
  name                = var.anf_pool_name
  location            = var.region
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_netapp_account.anf_account.name
  service_level       = var.service_level
  size_in_tb          = var.anf_pool_size
  tags = {
    Environment = var.tags_environment
    CreatedBy   = var.tags_created_by
  }

}

resource "azurerm_netapp_volume" "anf_volume_0" {
  name                = var.anf_volume_name_0
  location            = var.region
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_netapp_account.anf_account.name
  pool_name           = azurerm_netapp_pool.anf_pool.name
  subnet_id           = azurerm_subnet.subnet.id
  protocols           = var.protocol_NFSv3
  network_features    = var.network_features
  volume_path         = var.volume_path_0
  service_level       = var.service_level
  storage_quota_in_gb = var.storage_quota_in_gb

  tags = {
    Environment = var.tags_environment
    CreatedBy   = var.tags_created_by
  }

  lifecycle {
    prevent_destroy = false
  }

}

// Create a snapshot of the volume
resource "azurerm_netapp_snapshot" "vol_snapshot" {
  depends_on          = [azurerm_netapp_volume.anf_volume_0]
  name                = var.snapshot_name
  account_name        = azurerm_netapp_account.anf_account.name
  pool_name           = azurerm_netapp_pool.anf_pool.name
  volume_name         = azurerm_netapp_volume.anf_volume_0.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.region
}

// Output the Snapshot ID
output "snapshot_id" {
  value = azurerm_netapp_snapshot.vol_snapshot.id
}

resource "azurerm_netapp_volume" "anf_volume_1" {
  name                = var.anf_volume_name_1
  location            = var.region
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_netapp_account.anf_account.name
  pool_name           = azurerm_netapp_pool.anf_pool.name
  subnet_id           = azurerm_subnet.subnet.id
  protocols           = var.protocol_NFSv3
  network_features    = var.network_features
  volume_path         = var.volume_path_1
  service_level       = var.service_level
  storage_quota_in_gb = var.storage_quota_in_gb

  // Create the volume from the snapshot previously created
  create_from_snapshot_resource_id = azurerm_netapp_snapshot.vol_snapshot.id

  tags = {
    Environment = var.tags_environment
    CreatedBy   = var.tags_created_by
  }

  lifecycle {
    prevent_destroy = false
  }

}