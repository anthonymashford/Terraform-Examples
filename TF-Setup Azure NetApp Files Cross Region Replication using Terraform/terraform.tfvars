######################################################################################
#                              (C) Mash'o'soft 2022                                  #
#                This file is used to define the variables for your lab              #
#                  Modify these parameters to meet your requirements                 #
######################################################################################
# Change to meet use case, i.e Demo, Lab, Testing etc.
use = "lab"
# Change this if you'd like to your demo tailor to client name
prefix = "Demo"
# Change this if you want to highlight your Geo
geo = "emea"
# If you would like to use diferent regions change this
region_1 = "northeurope"
# If you would like to use diferent regions change this
region_2 = "westeurope"
# Environment - Change this as required
tag_environment = "Lab73"
# Created By - Change this as required
tag_createdby = "Yourname"
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
domain               = "Your.domain"
ou                   = "OU=YourOU"
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