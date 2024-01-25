/* Uses Cloud-Init options from Proxmox 5.2 */

resource "proxmox_vm_qemu" "vms" {
  for_each = var.vm_configs

  name = each.value.name

  # Boot configuration
  vm_state = "running"
  onboot   = true
  boot     = "order=scsi0;ide2;net0"
  bootdisk = "scsi0"
  scsihw = "virtio-scsi-pci"

  # PM config
  target_node = var.pm_node
  agent       = 1
  clone       = var.pm_template

  # System configuration
  cores   = each.value.cores
  sockets = each.value.sockets
  memory  = each.value.memory

  # Network configuration
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  ipconfig0 = each.value.ipconfig0

  # Storage configuration
  disks {
    scsi {
      scsi0 {
        disk {
          storage = "storage"
          size    = each.value.size #In Gigabytes
        }
      }
    }
  }
}
