resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = var.default_datastore_id
  node_name    = var.pm_node
  source_raw {
    data = <<EOF
#cloud-config
preserve_hostname: true
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
  filename = "${path.root}/files/id_rsa.pub"
}

output "cloud_conf_id" {
  value = proxmox_virtual_environment_file.cloud_config.id
}