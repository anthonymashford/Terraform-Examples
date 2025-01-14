# Create random string for VM 1
resource "random_string" "vm_rs_1" {
  length  = 5
  special = false
}

# Create Public IP for VM1
resource "azurerm_public_ip" "pip_vm1" {
  name                = "pip-${var.vm1_name}-${random_string.vm_rs_1.result}"
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

# Create NIC for VM1
resource "azurerm_network_interface" "nic_vm1" {
  name                = "nic-${var.vm1_name}-${random_string.vm_rs_1.result}"
  location            = azurerm_resource_group.rg_1.location
  resource_group_name = azurerm_resource_group.rg_1.name


  ip_configuration {
    name                          = "ipconfig-${var.vm1_name}-${random_string.vm_rs_1.result}"
    subnet_id                     = azurerm_subnet.vnet_1_snet_1.id
    private_ip_address_allocation = var.nic_ip_allocation
    public_ip_address_id          = azurerm_public_ip.pip_vm1.id
  }

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }

}

# Create VM 1
resource "azurerm_windows_virtual_machine" "vm1" {
  name                = "vm-${var.vm1_name}-${random_string.vm_rs_1.result}"
  depends_on          = [azurerm_key_vault.keyvault]
  resource_group_name = azurerm_resource_group.rg_1.name
  location            = azurerm_resource_group.rg_1.location
  size                = var.vm1_size
  admin_username      = azurerm_key_vault_secret.admin_secret.name
  admin_password      = azurerm_key_vault_secret.admin_secret.value
  network_interface_ids = [
    azurerm_network_interface.nic_vm1.id,
  ]

  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.vm1_publisher
    offer     = var.vm1_offer
    sku       = var.vm1_sku
    version   = var.vm1_version
  }

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}

# Create random string for VM 2
resource "random_string" "vm_rs_2" {
  length  = 5
  special = false
}

# Create Public IP for VM2
resource "azurerm_public_ip" "pip_vm2" {
  name                = "pip-${var.vm2_name}-${random_string.vm_rs_2.result}"
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

# Create NIC for VM2
resource "azurerm_network_interface" "nic_vm2" {
  name                = "nic-${var.vm2_name}-${random_string.vm_rs_2.result}"
  location            = azurerm_resource_group.rg_2.location
  resource_group_name = azurerm_resource_group.rg_2.name


  ip_configuration {
    name                          = "ipconfig-${var.vm2_name}-${random_string.vm_rs_2.result}"
    subnet_id                     = azurerm_subnet.vnet_2_snet_1.id
    private_ip_address_allocation = var.nic_ip_allocation
    #private_ip_address            = var.vm2_ip_address
    public_ip_address_id = azurerm_public_ip.pip_vm2.id
  }

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }

}

# Create VM 2
resource "azurerm_windows_virtual_machine" "vm2" {
  name                = "vm-${var.vm2_name}-${random_string.vm_rs_2.result}"
  depends_on          = [azurerm_key_vault.keyvault]
  resource_group_name = azurerm_resource_group.rg_2.name
  location            = azurerm_resource_group.rg_2.location
  size                = var.vm2_size
  admin_username      = azurerm_key_vault_secret.admin_secret.name
  admin_password      = azurerm_key_vault_secret.admin_secret.value
  network_interface_ids = [
    azurerm_network_interface.nic_vm2.id,
  ]

  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.vm1_publisher
    offer     = var.vm1_offer
    sku       = var.vm1_sku
    version   = var.vm1_version
  }

  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }
}