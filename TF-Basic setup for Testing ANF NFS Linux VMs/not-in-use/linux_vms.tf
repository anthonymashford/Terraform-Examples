# Create Public IP for VM 3
resource "azurerm_public_ip" "pip_vm3" {
  name                = "pip-${var.vm3_name}-${random_string.random.result}"
  resource_group_name = azurerm_resource_group.region1-rg1.name
  location            = azurerm_resource_group.region1-rg1.location
  allocation_method   = var.pip_allocation
  sku                 = var.pip_sku

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}

# Create NIC for Linux VM 3
resource "azurerm_network_interface" "nic_vm3" {
  name                = "nic-${var.vm3_name}-${random_string.random.result}"
  location            = azurerm_resource_group.region1-rg1.location
  resource_group_name = azurerm_resource_group.region1-rg1.name

  ip_configuration {
    name                          = "ipconfig-${var.vm3_name}-${random_string.random.result}"
    subnet_id                     = azurerm_subnet.region1-vnet1-snet1.id
    private_ip_address_allocation = var.nic_ip_allocation
    public_ip_address_id          = azurerm_public_ip.pip_vm3.id
  }

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }

}

# Create VM 3
resource "azurerm_linux_virtual_machine" "vm3" {
  name                            = "vm-${var.vm3_name}-${random_string.random.result}"
  depends_on                      = [azurerm_key_vault.kv1]
  resource_group_name             = azurerm_resource_group.region1-rg1.name
  location                        = azurerm_resource_group.region1-rg1.location
  size                            = var.vm3_size
  admin_username                  = azurerm_key_vault_secret.vmpassword.name
  admin_password                  = azurerm_key_vault_secret.vmpassword.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic_vm3.id,
  ]

  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.vm3_publisher
    offer     = var.vm3_offer
    sku       = var.vm3_sku
    version   = var.vm3_version
  }

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}

# Create Public IP for VM 4
resource "azurerm_public_ip" "pip_vm4" {
  name                = "pip-${var.vm4_name}-${random_string.random.result}"
  resource_group_name = azurerm_resource_group.region2-rg1.name
  location            = azurerm_resource_group.region2-rg1.location
  allocation_method   = var.pip_allocation
  sku                 = var.pip_sku

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}

# Create NIC for Linux VM 4
resource "azurerm_network_interface" "nic_vm4" {
  name                = "nic-${var.vm4_name}-${random_string.random.result}"
  location            = azurerm_resource_group.region2-rg1.location
  resource_group_name = azurerm_resource_group.region2-rg1.name

  ip_configuration {
    name                          = "ipconfig-${var.vm4_name}-${random_string.random.result}"
    subnet_id                     = azurerm_subnet.region2-vnet1-snet1.id
    private_ip_address_allocation = var.nic_ip_allocation
    public_ip_address_id          = azurerm_public_ip.pip_vm4.id
  }

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }

}

# Create VM 4
resource "azurerm_linux_virtual_machine" "vm4" {
  name                            = "vm-${var.vm4_name}-${random_string.random.result}"
  depends_on                      = [azurerm_key_vault.kv1]
  resource_group_name             = azurerm_resource_group.region2-rg1.name
  location                        = azurerm_resource_group.region2-rg1.location
  size                            = var.vm4_size
  admin_username                  = azurerm_key_vault_secret.vmpassword.name
  admin_password                  = azurerm_key_vault_secret.vmpassword.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic_vm4.id,
  ]

  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.vm4_publisher
    offer     = var.vm4_offer
    sku       = var.vm4_sku
    version   = var.vm4_version
  }

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}