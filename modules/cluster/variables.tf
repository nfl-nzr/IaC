variable "pm_url" {
  type        = string
  description = "API URL of the proxmox instance to be managed"
}

variable "name" {}
variable "sockets" {}
variable "cores" {}
variable "memory" {}
variable "ip_address" {}
variable "size" {}

variable "pm_node" {
  type        = string
  description = "Target node to create the vms on"
}

variable "pm_template" {
  type        = string
  description = "Template file to use"
  default     = "9000"
}

variable "default_gateway_ip" {
  type        = string
  description = "Default IP gateway"
  default     = "192.168.1.1"
}

variable "default_datastore_id" {}
variable "default_user" {}
variable "default_password" {}
# variable "cloud_conf_id" {}
variable "auth_user" {}
variable "auth_user_password" {}