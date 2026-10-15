variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "Central India"
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "address_space" {
  type        = list(string)
  description = "VNet CIDR ranges"
  default     = ["10.10.0.0/16"]
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
  default     = "snet-app"
}

variable "subnet_prefix" {
  type        = string
  description = "Subnet CIDR range"
  default     = "10.10.1.0/24"
}

variable "storage_account_name" {
  type        = string
  description = "Globally unique storage account name"

  validation {
    condition = (
      length(var.storage_account_name) >= 3 &&
      length(var.storage_account_name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.storage_account_name))
    )
    error_message = "Storage name must contain 3-24 lowercase letters or numbers."
  }
}

variable "tags" {
  type        = map(string)
  description = "Common Azure resource tags"
  default = {
    environment = "dev"
    managed_by  = "terraform"
    project     = "azure-app"
  }
}