variable "use" {
  description = "Azure Region"
  default     = ""
}

variable "prefix" {
  description = "Azure Region"
  default     = ""
}

variable "geo" {
  description = "Azure Region"
  default     = ""
}

variable "region_1" {
  description = "Azure Region"
  default     = ""
}

variable "region_2" {
  description = "Azure Region"
  default     = ""
}

variable "tag_environment" {
  description = "Resource Group Tags"
  default     = ""
}

variable "tag_createdby" {
  description = "Resource Group Tags"
  default     = ""
}

variable "tag_createdwith" {
  description = "Resource Group Tags"
  default     = ""
}

variable "tag_project" {
  description = "Resource Group Tags"
  default     = ""
}

variable "vnet_1" {
  description = "VNet"
  default     = ""
}

variable "vnet_2" {
  description = "VNet"
  default     = ""
}

variable "address_space_region_1" {
  description = "VNet address space"
  default     = ""
}

variable "address_space_region_2" {
  description = "VNet address space"
  default     = ""
}

variable "dns_server_1" {
  description = "DNS Server"
  default     = ""
}

variable "dns_server_2" {
  description = "DNS Server"
  default     = ""
}

variable "dns_server_3" {
  description = "DNS Server"
  default     = ""
}

variable "dns_server_4" {
  description = "DNS Server"
  default     = ""
}

variable "dns_server_azure" {
  description = "DNS Server"
  default     = ""
}

variable "snet_1" {
  description = "Subnet"
  default     = ""
}

variable "snet_2" {
  description = "Subnet"
  default     = ""
}

variable "address_vnet_1_snet_1" {
  description = "Subnet address"
  default     = ""
}

variable "address_vnet_1_snet_2" {
  description = "Subnet address"
  default     = ""
}

variable "address_vnet_2_snet_1" {
  description = "Subnet address"
  default     = ""
}

variable "address_vnet_2_snet_2" {
  description = "Subnet address"
  default     = ""
}

variable "labadmin" {
  description = "Subnet address"
  default     = ""
}

variable "vm1_name" {
  description = "VM1 name"
  default     = ""
}
variable "vm2_name" {
  description = "VM2 name"
  default     = ""
}
variable "vm3_name" {
  description = "VM3 name"
  default     = ""
}
variable "vm4_name" {
  description = "VM4 name"
  default     = ""
}

variable "vm1_sql_name" {
  description = "VM SQL 1 name"
  default     = ""
}

variable "vm2_sql_name" {
  description = "VM SQL 1 name"
  default     = ""
}

variable "pip_allocation" {
  description = "pip ip allocation"
  default     = ""
}
variable "pip_sku" {
  description = "pip sku"
  default     = ""
}
variable "nic_ip_allocation" {
  description = "NIC IP allocation"
  default     = ""
}
variable "storage_account_type" {
  description = "Storage account type"
  default     = ""
}
variable "create_option" {
  description = "Create empty desk"
  default     = ""
}
variable "disk_size_gb" {
  description = "Disk size"
  default     = ""
}
variable "disk_caching" {
  description = "Disk size"
  default     = ""
}
variable "vm1_ip_address" {
  description = "Disk size"
  default     = ""
}
variable "vm2_ip_address" {
  description = "Disk size"
  default     = ""
}
variable "vm3_ip_address" {
  description = "Disk size"
  default     = ""
}
variable "vm4_ip_address" {
  description = "Disk size"
  default     = ""
}
variable "vm1_sql_ip_address" {
  description = "Disk size"
  default     = ""
}
variable "vm1_size" {
  description = "VM Size"
  default     = ""
}
variable "vm2_size" {
  description = "VM Size"
  default     = ""
}
variable "vm3_size" {
  description = "VM Size"
  default     = ""
}
variable "vm4_size" {
  description = "VM Size"
  default     = ""
}
variable "vm1_sql_size" {
  description = "VM Size"
  default     = ""
}
variable "vm1_publisher" {
  description = "VM Publisher"
  default     = ""
}
variable "vm2_publisher" {
  description = "VM Publisher"
  default     = ""
}
variable "vm3_publisher" {
  description = "VM Publisher"
  default     = ""
}
variable "vm4_publisher" {
  description = "VM Publisher"
  default     = ""
}
variable "vm1_sql_publisher" {
  description = "VM Publisher"
  default     = ""
}
variable "vm1_offer" {
  description = "VM Offer"
  default     = ""
}
variable "vm2_offer" {
  description = "VM Offer"
  default     = ""
}
variable "vm3_offer" {
  description = "VM Offer"
  default     = ""
}
variable "vm4_offer" {
  description = "VM Offer"
  default     = ""
}
variable "vm1_sql_offer" {
  description = "VM Offer"
  default     = ""
}
variable "vm1_sku" {
  description = "VM SKU"
  default     = ""
}
variable "vm2_sku" {
  description = "VM SKU"
  default     = ""
}
variable "vm3_sku" {
  description = "VM SKU"
  default     = ""
}
variable "vm4_sku" {
  description = "VM SKU"
  default     = ""
}
variable "vm1_sql_sku" {
  description = "VM SKU"
  default     = ""
}
variable "vm1_version" {
  description = "VM Version"
  default     = ""
}
variable "vm2_version" {
  description = "VM Version"
  default     = ""
}
variable "vm3_version" {
  description = "VM Version"
  default     = ""
}
variable "vm4_version" {
  description = "VM Version"
  default     = ""
}
variable "vm1_sql_version" {
  description = "VM Version"
  default     = ""
}
variable "domain" {
  description = "AD Domain Name"
  default     = ""
}

variable "ou" {
  description = "AD OU"
  default     = ""
}

variable "cap_pool_tier" {
  description = "Capacity Tier"
  default     = ""
}

variable "cap_pool_size" {
  description = "Capacity Pool Size"
  default     = ""
}

variable "vol_path_nfs" {
  description = "NFS Volume Path"
  default     = ""
}

variable "vol_path_smb" {
  description = "NFS Volume Path"
  default     = ""
}

variable "service_level_std" {
  description = "ANF Service Level"
  default     = ""
}

variable "protocol_nfs" {
  description = "Volume Protocol"
  default     = ""
}

variable "protocol_smb" {
  description = "Volume Protocol"
  default     = ""
}

variable "qos_type" {
  description = "Volume Protocol"
  default     = ""
}