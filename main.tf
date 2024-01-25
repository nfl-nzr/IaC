module "nodes" {
  source = "./cluster"

  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_node             = var.pm_node
  vm_configs          = local.vms
  pm_template         = var.pm_template
}
