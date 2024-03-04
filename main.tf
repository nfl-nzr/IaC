module "nodes" {
  source = "./modules/cluster"

  providers = {
    proxmox = proxmox
  }

  for_each             = local.vms
  name                 = each.value.name
  sockets              = each.value.sockets
  cores                = each.value.cores
  memory               = each.value.memory
  ip_address           = each.value.ip_address
  size                 = each.value.size
  pm_url               = var.pm_url
  pm_node              = var.pm_node
  pm_template          = var.pm_template
  default_gateway_ip   = var.default_gateway_ip
  default_datastore_id = var.default_datastore_id
  default_user         = var.default_user
  default_password     = var.default_password
  auth_user            = var.auth_user
  auth_user_password   = var.auth_user_password
}

module "jump_server" {

  source = "./modules/ec2_vps"

  instance_name               = local.ec2_instances.jump_server.instance_name
  instance_type               = local.ec2_instances.jump_server.instance_type
  key_name                    = local.ec2_instances.jump_server.key_name
  network_security_group_name = local.ec2_instances.jump_server.network_security_group_name
}