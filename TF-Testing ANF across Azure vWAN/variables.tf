# Core Variables
variable "lab-name" {
    description = "Lab Name"
    default     = ""
}

variable "tag_environment" {
    description = "Environment Tag"
    default     = ""
}

variable "tag_createdby" {
    description = "Created by Tag"
    default     = ""
}

variable "tag_createdwith" {
    description = "Created by Tag"
    default     = ""
}

variable "tag_project" {
    description = "Project Tag"
    default     = ""
}

variable "region1" {
    description = "Region 1"
    default     = ""
}

variable "region2" {
    description = "Region 2"
    default     = ""
}

variable "vwan-region1-hub1-prefix1" {
    description = "vwan-region1-hub1-prefix1"
    default     = ""
}

variable "vwan-region2-hub1-prefix1" {
    description = "vwan-region2-hub1-prefix1"
    default     = ""
}

# Networking
variable "region1-vnet1-address-space" {
    description = "region1-vnet1-address-space"
    default     = ""
}

variable "region1-vnet1-snet1-range" {
    description = "region1-vnet1-snet1-range"
    default     = ""
}

variable "region1-vnet1-snet2-range" {
    description = "region1-vnet1-snet1-range"
    default     = ""
}

variable "region2-vnet1-address-space" {
    description = "region2-vnet1-address-space"
    default     = ""
}

variable "region2-vnet1-snet1-range" {
    description = "region2-vnet1-snet1-range"
    default     = ""
}

variable "region2-vnet1-snet2-range" {
    description = "region2-vnet1-snet1-range"
    default     = ""
}

# VMs
variable "vmsize" {
    description = "vmsize"
    default     = ""
}

variable "adminusername" {
    description = "adminusername"
    default     = ""
}

# ANF
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

variable "vol_path_nfs" {
  description = "Volume path"
  default     = ""
}

variable "service_level_std" {
  description = "ANF standard service tier"
  default     = ""
}

variable "protocol_nfs" {
  description = "NFS Protocol"
  default     = ""
}

variable "volume_size" {
  description = "Volume Size"
  default     = ""
}

# Linux VMs

variable "pip_allocation" {
  description = "PIP"
  default     = ""
}

variable "pip_sku" {
  description = "PIP SKU"
  default     = ""
}

variable "nic_ip_allocation" {
  description = "NIC Allocation"
  default     = ""
}

variable "storage_account_type" {
  description = "Storage Account Type"
  default     = ""
}

variable "create_option" {
  description = ""
  default     = ""
}

variable "disk_size_gb" {
  description = "Disk Size"
  default     = ""
}

variable "disk_caching" {
  description = "Disk Caching"
  default     = ""
}

variable "vm3_name" {
  description = "VM3 Name"
  default     = ""
}

variable "vm3_ip_address" {
  description = ""
  default     = ""
}

variable "vm3_size" {
  description = ""
  default     = ""
}

variable "vm3_publisher" {
  description = ""
  default     = ""
}

variable "vm3_offer" {
  description = ""
  default     = ""
}

variable "vm3_sku" {
  description = ""
  default     = ""
}

variable "vm3_version" {
  description = ""
  default     = ""
}

variable "vm4_name" {
  description = "VM4 Name"
  default     = ""
}

variable "vm4_ip_address" {
  description = ""
  default     = ""
}

variable "vm4_size" {
  description = ""
  default     = ""
}

variable "vm4_publisher" {
  description = ""
  default     = ""
}

variable "vm4_offer" {
  description = ""
  default     = ""
}

variable "vm4_sku" {
  description = ""
  default     = ""
}

variable "vm4_version" {
  description = ""
  default     = ""
}