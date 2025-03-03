variable "rg_name" {
  description = "The name of the resource group"
  default     = ""

}

variable "region" {
  description = "The Azure region to deploy resources"
  default     = ""

}

variable "tags_environment" {
  description = "The environment tag"
  default     = ""

}

variable "tags_created_by" {
  description = "The created by tag"
  default     = ""

}

variable "vnet_name" {
  description = "The name of the virtual network"
  default     = ""

}

variable "vnet_address_space" {
  description = "The address space of the virtual network"
  default     = []

}

variable "vnet_dns_servers" {
  description = "The DNS servers of the virtual network"
  default     = []

}

variable "subnet_name" {
  description = "The name of the subnet"
  default     = ""

}

variable "subnet_address_prefixes" {
  description = "The address prefixes of the subnet"
  default     = []

}

variable "delegation_name" {
  description = "The name of the delegation"
  default     = ""

}

variable "anf_account_name" {
  description = "The name of the Azure NetApp Files account"
  default     = ""

}


variable "anf_pool_name" {
  description = "The name of the Azure NetApp Files pool"
  default     = ""

}

variable "service_level" {
  description = "The service level of the Azure NetApp Files pool"
  default     = ""

}

variable "anf_pool_size" {
  description = "The size of the Azure NetApp Files pool in TB"
  default     = ""

}

variable "anf_volume_name_0" {
  description = "The name of the Azure NetApp Files volume"
  default     = ""

}

variable "protocol_NFSv3" {
  description = "The NFSv3 protocol of the Azure NetApp Files volume"
  default     = ""

}

variable "network_features" {
  description = "The network features of the Azure NetApp Files volume"
  default     = ""

}

variable "volume_path_0" {
  description = "The path of the Azure NetApp Files volume"
  default     = ""

}
variable "storage_quota_in_gb" {
  description = "The storage quota of the Azure NetApp Files volume in GB"
  default     = ""

}

variable "snapshot_name" {
  description = "The name of the Azure NetApp Files snapshot"
  default     = ""

}

variable "anf_volume_name_1" {
  description = "The name of the Azure NetApp Files volume"
  default     = ""
}

variable "volume_path_1" {
  description = "The path of the Azure NetApp Files volume"
  default     = ""

}
