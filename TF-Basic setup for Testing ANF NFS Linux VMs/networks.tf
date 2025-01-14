# Networks 
# Region 1 VNET 1
resource "azurerm_virtual_network" "region1-vnet1" {
  name                = "vnet1-${var.region1}"
  location            = azurerm_resource_group.region1-rg1.location
  resource_group_name = azurerm_resource_group.region1-rg1.name
  address_space       = [var.region1-vnet1-address-space]
  tags = {
    Environment = var.tag_environment
  }
}
resource "azurerm_subnet" "region1-vnet1-snet1" {
  name                 = "snet1-vnet1-${var.region1}"
  resource_group_name  = azurerm_resource_group.region1-rg1.name
  virtual_network_name = azurerm_virtual_network.region1-vnet1.name
  address_prefixes     = [var.region1-vnet1-snet1-range]
}

resource "azurerm_subnet" "region1-vnet1-snet2" {
  name                 = "snet2-vnet1-${var.region1}"
  resource_group_name  = azurerm_resource_group.region1-rg1.name
  virtual_network_name = azurerm_virtual_network.region1-vnet1.name
  address_prefixes     = [var.region1-vnet1-snet2-range]
  delegation {
    name = "delegation"
    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

# Region 2 VNET 1
resource "azurerm_virtual_network" "region2-vnet1" {
  name                = "vnet1-${var.region2}"
  location            = azurerm_resource_group.region2-rg1.location
  resource_group_name = azurerm_resource_group.region2-rg1.name
  address_space       = [var.region2-vnet1-address-space]
  tags = {
    Environment = var.tag_environment
  }
}
resource "azurerm_subnet" "region2-vnet1-snet1" {
  name                 = "snet1-vnet1-${var.region2}"
  resource_group_name  = azurerm_resource_group.region2-rg1.name
  virtual_network_name = azurerm_virtual_network.region2-vnet1.name
  address_prefixes     = [var.region2-vnet1-snet1-range]
}

resource "azurerm_subnet" "region2-vnet1-snet2" {
  name                 = "snet2-vnet1-${var.region2}"
  resource_group_name  = azurerm_resource_group.region2-rg1.name
  virtual_network_name = azurerm_virtual_network.region2-vnet1.name
  address_prefixes     = [var.region2-vnet1-snet2-range]
  delegation {
    name = "delegation"
    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

# NSGs
# Get your IP address 
data "http" "clientip" {
  url = "https://ipv4.icanhazip.com/"
}

#Lab NSG
resource "azurerm_network_security_group" "region1-nsg" {
  name                = "nsg1-${var.region1}"
  location            = azurerm_resource_group.region1-rg1.location
  resource_group_name = azurerm_resource_group.region1-rg1.name

  security_rule {
    name                       = "RDP-In"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "${chomp(data.http.clientip.body)}/32"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "SSH-In"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${chomp(data.http.clientip.body)}/32"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_security_group" "region2-nsg" {
  name                = "nsg1-${var.region2}"
  location            = azurerm_resource_group.region2-rg1.location
  resource_group_name = azurerm_resource_group.region2-rg1.name

  security_rule {
    name                       = "RDP-In"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    Environment = var.tag_environment
  }
}
# NSG Association
resource "azurerm_subnet_network_security_group_association" "region1-vnet1-snet1" {
  subnet_id                 = azurerm_subnet.region1-vnet1-snet1.id
  network_security_group_id = azurerm_network_security_group.region1-nsg.id
}
resource "azurerm_subnet_network_security_group_association" "region2-vnet1-snet1" {
  subnet_id                 = azurerm_subnet.region2-vnet1-snet1.id
  network_security_group_id = azurerm_network_security_group.region2-nsg.id
}