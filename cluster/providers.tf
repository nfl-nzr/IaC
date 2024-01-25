terraform {
  required_providers {
    proxmox = {
      source = "TheGameProfi/proxmox"
      version = "2.10.0"
    }
  }
}
provider "proxmox" {
  pm_debug = true
  pm_api_url = var.pm_api_url
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret

  # (Optional) Skip TLS Verification
  pm_tls_insecure = true
}