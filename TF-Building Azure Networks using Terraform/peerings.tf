# Create VNet peering VNet 1 to 2
resource "azurerm_virtual_network_peering" "peer-1-to-2" {
  name                         = "peer-${var.vnet_1}-to-${var.vnet_2}"
  resource_group_name          = azurerm_resource_group.rg_1.name
  virtual_network_name         = azurerm_virtual_network.vnet_1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet_2.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
resource "azurerm_virtual_network_peering" "peer-2-to-1" {
  name                         = "peer-${var.vnet_2}-to-${var.vnet_1}"
  resource_group_name          = azurerm_resource_group.rg_2.name
  virtual_network_name         = azurerm_virtual_network.vnet_2.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet_1.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}