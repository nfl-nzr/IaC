terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

# provider "proxmox" {
#   alias = "px"
#   endpoint = var.pm_url
#   insecure = true
#   username = var.auth_user
#   password = var.auth_user_password

#   ssh {
#     agent = true
#   }
# }