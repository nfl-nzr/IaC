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

variable "vm_configs" {
  type = map(object({
    name : string,
    cores : number,
    sockets : number,
    memory : number,
    ipconfig0 : string,
    size : string
  }))
  description = "List of vm configurations"
}

variable "pm_node" {
  type        = string
  description = "Target node to create the vms on"
}

variable "pm_template" {
  type        = string
  description = "Template file to use"
}
