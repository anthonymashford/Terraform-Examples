# Create VNet 1
resource "azurerm_virtual_network" "vnet_1" {
  
  name                = "${var.vnet_1}-${random_string.rg_random_1.result}"
  location            = var.region_1
  resource_group_name = azurerm_resource_group.rg_1.name
  address_space       = [var.address_space_region_1]
  dns_servers         = [var.dns_server_1, var.dns_server_2, var.dns_server_azure]
  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}

# Create VNet 1 Subnet 1
resource "azurerm_subnet" "vnet_1_snet_1" {
  
  name                 = "${var.snet_1}-${var.vnet_1}-${random_string.rg_random_1.result}"
  resource_group_name  = azurerm_resource_group.rg_1.name
  virtual_network_name = azurerm_virtual_network.vnet_1.name
  address_prefixes     = [var.address_vnet_1_snet_1]
}

# Create VNet 1 Subnet 2
resource "azurerm_subnet" "vnet_1_snet_2" {
  
  name                 = "${var.snet_2}-${var.vnet_1}-${random_string.rg_random_1.result}"
  resource_group_name  = azurerm_resource_group.rg_1.name
  virtual_network_name = azurerm_virtual_network.vnet_1.name
  address_prefixes     = [var.address_vnet_1_snet_2]
  delegation {
    name = "delegation"
    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

# Create VNet 2
resource "azurerm_virtual_network" "vnet_2" {
  
  name                = "${var.vnet_2}-${random_string.rg_random_2.result}"
  location            = var.region_2
  resource_group_name = azurerm_resource_group.rg_2.name
  address_space       = [var.address_space_region_2]
  dns_servers         = [var.dns_server_1, var.dns_server_2, var.dns_server_azure]
  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}

# Create VNet 2 Subnet 1
resource "azurerm_subnet" "vnet_2_snet_1" {
  
  name                 = "${var.snet_1}-${var.vnet_2}-${random_string.rg_random_2.result}"
  resource_group_name  = azurerm_resource_group.rg_2.name
  virtual_network_name = azurerm_virtual_network.vnet_2.name
  address_prefixes     = [var.address_vnet_2_snet_1]
}

# Create VNet 2 Subnet 2
resource "azurerm_subnet" "vnet_2_snet_2" {
  
  name                 = "${var.snet_2}-${var.vnet_2}-${random_string.rg_random_2.result}"
  resource_group_name  = azurerm_resource_group.rg_2.name
  virtual_network_name = azurerm_virtual_network.vnet_2.name
  address_prefixes     = [var.address_vnet_2_snet_2]
  delegation {
    name = "delegation"
    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}