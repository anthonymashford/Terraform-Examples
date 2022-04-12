# Create VNet 1
resource "azurerm_virtual_network" "vnet_1" {
  name                = "${var.vnet_1}-${random_string.rg_random_1.result}"
  location            = var.region_1
  resource_group_name = azurerm_resource_group.rg_1.name
  address_space       = [var.address_space_region_1]
  dns_servers         = [var.dns_server_1]
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
  delegation {
    name = "delegation"
    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}