variable "rg_name_1" {
  description = "Resource Group 1 Name"
  default     = ""
}

variable "region_1" {
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

variable "prefix" {
  description = "Deployment Prefix"
  default     = ""
}

variable "labadmin" {
  description = "Lab Administrator"
  default     = ""
}

variable "smb_server" {
  description = "SMB Server Prefix"
  default     = ""
}

variable "dns_server" {
  description = "DNS Server"
  default     = ""
}

variable "domain" {
  description = "AD Domain"
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

variable "qos_type" {
  description = "QoS Type"
  default     = ""
}

variable "dns_server_1" {
  description = "DNS Server(s)"
  default     = ""
}

variable "address_space_region_1" {
  description = "Address space for VNet"
  default     = ""
}

variable "address_vnet_1_snet_1" {
  description = "Address space for Subnet"
  default     = ""
}

variable "vnet_1" {
  description = "VNet name"
  default     = ""
}

variable "snet_1" {
  description = "Subnet name"
  default     = ""
}

variable "service_level_std" {
  description = "ANF standard service tier"
  default     = ""
}

variable "volume_size" {
  description = "Volume Size"
  default     = ""
}

variable "vol_path_nfs" {
  description = "Volume path"
  default     = ""
}

variable "vol_path_smb" {
  description = "Volume path"
  default     = ""
}

variable "protocol_nfs" {
  description = "NFS Protocol"
  default     = ""
}

variable "protocol_smb" {
  description = "SMB Protocol"
  default     = ""
}