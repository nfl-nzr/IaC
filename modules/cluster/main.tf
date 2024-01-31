resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  provider = proxmox
  name     = var.name
  tags     = ["terraform"]
  started  = true
  on_boot  = true

  node_name = var.pm_node

  agent {
    enabled = true
  }

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
  }

  clone {
    vm_id = var.pm_template
    full  = false
  }

  disk {
    datastore_id = var.default_datastore_id
    file_format  = "raw"
    interface    = "scsi0"
    size         = var.size
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.default_gateway_ip
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}