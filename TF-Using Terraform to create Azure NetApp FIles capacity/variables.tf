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
  description = "Volume Protocol"
  default     = ""
}