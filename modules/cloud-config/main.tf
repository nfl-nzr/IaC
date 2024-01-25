resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = var.default_datastore_id
  node_name    = var.pm_node
  source_raw {
    data = <<EOF
#cloud-config
users:
  - default
  - name: ${var.default_user}
    groups:
      - sudo
    shell: /bin/bash
    ssh_pwauth: true
    plain_text_passwd: 0000
    lock_passwd: false
    ssh_authorized_keys:
      - ${trimspace(data.local_file.ssh_public_key.content)}
    sudo: ALL=(ALL) NOPASSWD:ALL
runcmd:
    - apt update
    - apt install -y qemu-guest-agent net-tools
    - systemctl enable qemu-guest-agent
    - systemctl start qemu-guest-agent
    - echo "done" > /tmp/cloud-config.done
    EOF
    file_name = "cloud-config.yaml"
  }
}

data "local_file" "ssh_public_key" {
  filename = "${path.root}/files/id_rsa.pub"
}

output "cloud_conf_id" {
  value = proxmox_virtual_environment_file.cloud_config.id
}