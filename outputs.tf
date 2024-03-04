output "instance_id" {
  description = "ID of EC2 instance"
  value       = module.jump_server.instance_public_ip
}