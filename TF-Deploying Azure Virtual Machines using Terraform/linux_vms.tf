# Create random string for VM 3
resource "random_string" "vm_rs_3" {
  length  = 5
  special = false
}

# Create Public IP for VM 3
resource "azurerm_public_ip" "pip_vm3" {
  name                = "pip-${var.vm3_name}-${random_string.vm_rs_3.result}"
  resource_group_name = azurerm_resource_group.rg_1.name
  location            = azurerm_resource_group.rg_1.location
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
  name                = "nic-${var.vm3_name}-${random_string.vm_rs_3.result}"
  location            = azurerm_resource_group.rg_1.location
  resource_group_name = azurerm_resource_group.rg_1.name

  ip_configuration {
    name                          = "ipconfig-${var.vm3_name}-${random_string.vm_rs_3.result}"
    subnet_id                     = azurerm_subnet.vnet_1_snet_1.id
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
  name                            = "vm-${var.vm3_name}-${random_string.vm_rs_3.result}"
  depends_on                      = [azurerm_key_vault.keyvault]
  resource_group_name             = azurerm_resource_group.rg_1.name
  location                        = azurerm_resource_group.rg_1.location
  size                            = var.vm3_size
  admin_username                  = azurerm_key_vault_secret.admin_secret.name
  admin_password                  = azurerm_key_vault_secret.admin_secret.value
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

# Create random string for VM 4
resource "random_string" "vm_rs_4" {
  length  = 5
  special = false
}

# Create Public IP for VM 4
resource "azurerm_public_ip" "pip_vm4" {
  name                = "pip-${var.vm4_name}-${random_string.vm_rs_4.result}"
  resource_group_name = azurerm_resource_group.rg_2.name
  location            = azurerm_resource_group.rg_2.location
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
  name                = "nic-${var.vm4_name}-${random_string.vm_rs_4.result}"
  location            = azurerm_resource_group.rg_2.location
  resource_group_name = azurerm_resource_group.rg_2.name

  ip_configuration {
    name                          = "ipconfig-${var.vm4_name}-${random_string.vm_rs_4.result}"
    subnet_id                     = azurerm_subnet.vnet_2_snet_1.id
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
  name                            = "vm-${var.vm4_name}-${random_string.vm_rs_4.result}"
  depends_on                      = [azurerm_key_vault.keyvault]
  resource_group_name             = azurerm_resource_group.rg_2.name
  location                        = azurerm_resource_group.rg_2.location
  size                            = var.vm4_size
  admin_username                  = azurerm_key_vault_secret.admin_secret.name
  admin_password                  = azurerm_key_vault_secret.admin_secret.value
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