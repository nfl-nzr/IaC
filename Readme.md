# nfl IaC

## Overview

Used to provision a 3 master and 2 slave cluster in proxmox.

## Prerequisites

List any prerequisites needed to use this Terraform project. This might include:

- Terraform = 1.6.6
- Providers
    - provider registry.terraform.io/bpg/proxmox v0.45.0
    - provider registry.terraform.io/hashicorp/local v2.4.1

## Installation

Instructions on how to install and initialize the Terraform project. This section typically includes:

1. Cloning the repository `git clone https://github.com/nfl-nzr/IaC.git`
2. Initializing Terraform workspace with `terraform init`
3. `cp sample.credentials.tfvars credentials.tfvars`
4. Update `credentials.tfvars` with variables specified.

## Usage
1. Plan with `terraform plan`
2. Provision with `terraform apply`
3. Destroy with `terraform destroy`

## NOTE
Static pub key is added to the sources for now. TODO will change in future.