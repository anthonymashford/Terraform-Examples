# vWAN Resources
# vWAN
resource "azurerm_virtual_wan" "vwan1" {
  name                = "vWAN-01-${var.lab-name}"
  resource_group_name = azurerm_resource_group.region1-rg1.name
  location            = azurerm_resource_group.region1-rg1.location

  # Configuration 
  office365_local_breakout_category = "OptimizeAndAllow"

  tags = {
    Environment = var.tag_environment
  }
}
# vWAN Hub 1
resource "azurerm_virtual_hub" "region1-vhub1" {
  name                = "hub-01-${var.region1}"
  resource_group_name = azurerm_resource_group.region1-rg1.name
  location            = azurerm_resource_group.region1-rg1.location
  virtual_wan_id      = azurerm_virtual_wan.vwan1.id
  address_prefix      = var.vwan-region1-hub1-prefix1

  tags = {
    Environment = var.tag_environment 
  }
}
# vWAN Hub 2
resource "azurerm_virtual_hub" "region2-vhub1" {
  name                = "hub-02-${var.region2}"
  resource_group_name = azurerm_resource_group.region2-rg1.name
  location            = azurerm_resource_group.region2-rg1.location
  virtual_wan_id      = azurerm_virtual_wan.vwan1.id
  address_prefix      = var.vwan-region2-hub1-prefix1

  tags = {
    Environment = var.tag_environment
  }
}
# vWAN Hub Connection 1
resource "azurerm_virtual_hub_connection" "region1-connection1" {
  name                      = "conn-vnet1-to-vwan-hub-${var.region1}"
  virtual_hub_id            = azurerm_virtual_hub.region1-vhub1.id
  remote_virtual_network_id = azurerm_virtual_network.region1-vnet1.id
}
# vWAN Hub Connection 2
resource "azurerm_virtual_hub_connection" "region2-connection1" {
  name                      = "conn-vnet1-to-vwan-hub-${var.region2}"
  virtual_hub_id            = azurerm_virtual_hub.region2-vhub1.id
  remote_virtual_network_id = azurerm_virtual_network.region2-vnet1.id
}