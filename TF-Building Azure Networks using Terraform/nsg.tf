# Get your IP address 
data "http" "clientip" {
  url = "https://ipv4.icanhazip.com/"
}

# Create Network Security Group Region 1
resource "azurerm_network_security_group" "nsg_1" {
  name                = "nsg-${var.vnet_1}-${var.snet_1}"
  location            = var.region_1
  resource_group_name = azurerm_resource_group.rg_1.name

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

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}

# Create Network Security Group Region 2
resource "azurerm_network_security_group" "nsg_2" {
  name                = "nsg-${var.vnet_2}-${var.snet_1}"
  location            = var.region_2
  resource_group_name = azurerm_resource_group.rg_2.name

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

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_vnet_1_snet_1" {
  subnet_id                 = azurerm_subnet.vnet_1_snet_1.id
  network_security_group_id = azurerm_network_security_group.nsg_1.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_vnet_2_snet_1" {
  subnet_id                 = azurerm_subnet.vnet_2_snet_1.id
  network_security_group_id = azurerm_network_security_group.nsg_2.id
}