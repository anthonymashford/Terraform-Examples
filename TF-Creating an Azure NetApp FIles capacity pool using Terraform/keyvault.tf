# Create Keyvault ID
resource "random_id" "keyvault_name" {
  byte_length = "3"
  prefix      = "keyvault-${var.prefix}-"
}

# Create Keyvault
data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "keyvault" {
  depends_on                  = [azurerm_resource_group.rg_1]
  name                        = random_id.keyvault_name.hex
  location                    = azurerm_resource_group.rg_1.location
  resource_group_name         = azurerm_resource_group.rg_1.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get", "backup", "delete", "list", "purge", "recover", "restore", "set",
    ]

    storage_permissions = [
      "get",
    ]
  }
  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }

}

# Create Random Password
resource "random_password" "admin_random_password" {
  length  = 20
  special = true
}

# Create Secret
resource "azurerm_key_vault_secret" "admin_secret" {
  name         = var.labadmin
  value        = random_password.admin_random_password.result
  key_vault_id = azurerm_key_vault.keyvault.id
  depends_on   = [azurerm_key_vault.keyvault]
}