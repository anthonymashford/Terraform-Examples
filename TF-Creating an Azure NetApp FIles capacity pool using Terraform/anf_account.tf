# Create Azure NetApp Files Account 1
resource "azurerm_netapp_account" "anf_acc_1" {
    name                = "anf-${var.region_1}-${random_string.rg_random_1.result}"
    resource_group_name = azurerm_resource_group.rg_1.name
    location            = var.region_1

  # Acitve Directory configuration. 
  # This section has been commented out as an ANF account already exists in my demo subscription and region(s).
  # Uncomment this section if you need to add Active Directory configuration and amend the .tfvars file to suit.
 /*
  active_directory {
    username            = azurerm_key_vault_secret.admin_secret.name
    password            = azurerm_key_vault_secret.admin_secret.value
    smb_server_name     = var.smb_server
    dns_servers         = [var.dns_server]
    domain              = var.domain
    organizational_unit = var.ou
  }
 */
  tags = {
    Environment = var.tag_environment
    CreatedBy   = var.tag_createdby
    CreatedWith = var.tag_createdwith
    Project     = var.tag_project
  }

}