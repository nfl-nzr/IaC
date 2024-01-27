# Create a common cloudinit config that adds a user called nfl to sudoers group, adds ssh pub key specified in files/id_rsa.pub file.
# User can also be added using virt-customize.

resource "proxmox_virtual_environment_file" "cloud_config" {
  provider = proxmox

  content_type = "snippets"
  datastore_id = var.default_datastore_id
  node_name    = var.pm_node
  source_raw {
    data      = <<EOF
#cloud-config
users:
  - name: ${var.default_user}
    groups:
      - sudo
    shell: /bin/bash
    ssh_pwauth: true
    passwd: $6$rounds=4096$6CZpGL9a8PYqV$7uk/LLMhGJ2agqWQ3MWIRi2kK653Hn.T7SE7cYm7qLscSAtV6EI1MdHNfaWk9DuqaBre6QDtKRR679eSQMWiK.
    lock_passwd: false
    ssh_authorized_keys:
      - ${trimspace(data.local_file.ssh_public_key.content)}
    sudo: ALL=(ALL) NOPASSWD:ALL
    EOF
    file_name = "cloud-config.yaml"
  }
}

data "local_file" "ssh_public_key" {
  provider = local
  filename = "${path.root}/files/id_rsa.pub"
}

output "cloud_conf_id" {
  value = proxmox_virtual_environment_file.cloud_config
}