variable "pm_url" {
  type        = string
  description = "API URL of the proxmox instance to be managed"
}

variable "pm_node" {
  type = string
}

variable "pm_template" {
  type        = string
  description = "Template to use"
}

variable "default_gateway_ip" {}
variable "default_datastore_id" {}
variable "default_user" {
  type = string
}

variable "default_password" {
  type = string
}
variable "auth_user" {}
variable "auth_user_password" {}