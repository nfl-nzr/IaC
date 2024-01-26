resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  for_each = var.vm_configs
  name     = each.value.name
  tags     = ["terraform"]
  started  = true
  on_boot  = true


  node_name = var.pm_node

  agent {
    enabled = true
  }

  cpu {
    cores = each.value.cores
  }

  memory {
    dedicated = each.value.memory
  }

  clone {
    vm_id        = var.pm_template
    full         = false
  }

  disk {
    datastore_id = var.default_datastore_id
    file_format  = "raw"
    interface    = "scsi0"
    size         = each.value.disk["size"]
  }

  initialization {
    ip_config {
      ipv4 {
        address = each.value.ip_address
        gateway = var.default_gateway_ip
      }
    }

    user_data_file_id = var.cloud_conf_id
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}
