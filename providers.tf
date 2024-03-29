terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.45.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.39.0"
    }
  }
}

provider "proxmox" {

  endpoint = var.pm_url
  insecure = true
  username = var.auth_user
  password = var.auth_user_password

  ssh {
    agent = true
  }
}

provider "aws" {

  region = var.aws_region

}