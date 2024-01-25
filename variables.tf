variable "pm_api_url" {
  type        = string
  description = "API URL of the proxmox instance to be managed"
}

variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type = string
}

variable "pm_node" {
  type = string
}

variable "pm_template" {
  type        = string
  description = "Template to use"
}
