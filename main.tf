module "cloudinit" {
  source = "./modules/cloud-config"

  providers = {
    local = local
    proxmox = proxmox
  }

  default_user         = var.default_user
  pm_node              = var.pm_node
  default_datastore_id = var.default_datastore_id
  pm_url               = var.pm_url
  auth_user            = var.auth_user
  auth_user_password   = var.auth_user_password
}

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
  pm_api_token_id      = var.pm_api_token_id
  pm_api_token_secret  = var.pm_api_token_secret
  pm_node              = var.pm_node
  pm_template          = var.pm_template
  default_gateway_ip   = var.default_gateway_ip
  default_datastore_id = var.default_datastore_id
  default_user         = var.default_user
  default_password     = var.default_password
  auth_user            = var.auth_user
  auth_user_password   = var.auth_user_password
  cloud_conf_id        = module.cloudinit.cloud_conf_id.id

}
