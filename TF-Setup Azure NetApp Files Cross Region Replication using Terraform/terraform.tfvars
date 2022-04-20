######################################################################################
#                              (C) Mash'o'soft 2021                                  #
#                This file is used to define the variables for your lab              #
#                  Modify these parameters to meet your requirements                 #
######################################################################################
# Change to meet use case, i.e Demo, Lab, Testing etc.
use = "lab"
# Change this if you'd like to your demo tailor to client name
prefix = "WAUG"
# Change this if you want to highlight your Geo
geo = "emea"
# If you would like to use diferent regions change this
region_1 = "northeurope"
# If you would like to use diferent regions change this
region_2 = "westeurope"
# Environment - Change this as required
tag_environment = "Lab73"
# Created By - Change this as required
tag_createdby = "Anthony"
# Created With - Change this as required
tag_createdwith = "Terraform"
# Project - This is requried if deploying into EMEA CSA Lab Subscription
tag_project = "emea-csa-anf"
######################################################################################
#                     Network - Modify these parameters as required                  #
######################################################################################
vnet_1                 = "vnet-01"
vnet_2                 = "vnet-02"
address_space_region_1 = "172.11.0.0/16"
address_space_region_2 = "172.12.0.0/16"
dns_server_1           = "10.1.1.4"
dns_server_2           = "10.4.1.4"
dns_server_3           = "10.7.1.4"
dns_server_4           = "10.8.1.4"
dns_server_azure       = "168.63.129.16"
snet_1                 = "snet-01"
snet_2                 = "snet-02"
address_vnet_1_snet_1  = "172.11.1.0/24"
address_vnet_1_snet_2  = "172.11.2.0/24"
address_vnet_2_snet_1  = "172.12.1.0/24"
address_vnet_2_snet_2  = "172.12.2.0/24"
######################################################################################
#                 Virtual Machines - Modify these parameters as required             #
######################################################################################
labadmin             = "labadmin"
vm1_name             = "msft01"
vm2_name             = "msft02"
vm3_name             = "linux01"
vm4_name             = "linux02"
vm1_sql_name         = "sql01"
vm2_sql_name         = "sql02"
pip_allocation       = "Dynamic"
pip_sku              = "Basic"
nic_ip_allocation    = "Dynamic"
storage_account_type = "StandardSSD_LRS"
create_option        = "Empty"
disk_size_gb         = "10"
disk_caching         = "ReadWrite"
vm1_ip_address       = "Dynamic"
vm1_size             = "Standard_DS3_v2"
vm1_publisher        = "MicrosoftWindowsServer"
vm1_offer            = "WindowsServer"
vm1_sku              = "2019-Datacenter"
vm1_version          = "latest"
vm2_ip_address       = "Dynamic"
vm2_size             = "Standard_DS3_v2"
vm2_publisher        = "MicrosoftWindowsServer"
vm2_offer            = "WindowsServer"
vm2_sku              = "2019-Datacenter"
vm2_version          = "latest"
vm3_ip_address       = "Dynamic"
vm3_size             = "Standard_DS3_v2"
vm3_publisher        = "Canonical"
vm3_offer            = "UbuntuServer"
vm3_sku              = "16.04-LTS"
vm3_version          = "latest"
vm4_ip_address       = "Dynamic"
vm4_size             = "Standard_DS3_v2"
vm4_publisher        = "Canonical"
vm4_offer            = "UbuntuServer"
vm4_sku              = "16.04-LTS"
vm4_version          = "latest"
vm1_sql_ip_address   = "Dynamic"
vm1_sql_size         = "Standard_DS3_v2"
vm1_sql_publisher    = "MicrosoftSQLServer"
vm1_sql_offer        = "sql2019-ws2019"
vm1_sql_sku          = "standard"
vm1_sql_version      = "latest"
domain               = "azuretech.lab"
ou                   = "OU=ATL-ANF,OU=ATL"
######################################################################################
#               Azure NetApp Files - Modify these parameters as required             #
######################################################################################
cap_pool_tier     = "Standard"
cap_pool_size     = "4"
vol_path_nfs      = "nfs-vol"
vol_path_smb      = "smb-vol"
service_level_std = "Standard"
protocol_nfs      = "NFSv3"
protocol_smb      = "CIFS"
qos_type          = "Auto"