variable "image_name" {
  type        = string
  description = "Custom Linux image name"
  default     = "linux-custom-image"
}

variable "image_version" {
  type        = string
  description = "Image version"
  default     = "v1.0.0"
}

variable "location" {
  type        = string
  description = "Cloud region"
  default     = "eastus"
}

variable "vm_size" {
  type        = string
  description = "VM instance size"
  default     = "Standard_DS2_v2"
}

variable "ssh_username" {
  type        = string
  description = "SSH username"
  default     = "packer"
}
