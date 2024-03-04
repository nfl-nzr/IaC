locals {

  ec2_instances = {
    "jump_server" = {
      instance_name               = "jump-server"
      key_name                    = "deployer-key"
      network_security_group_name = "nsg-inbound"
      instance_type               = "t3.micro"
    }
  }

  vms = {
    "master-01" = {
      name       = "master-01"
      cores      = 4
      sockets    = 1
      memory     = 4096
      ip_address = "192.168.1.110/24"
      size       = 30
    }

    "master-02" = {
      name       = "master-02"
      cores      = 2
      sockets    = 1
      memory     = 2048
      ip_address = "192.168.1.111/24"
      size       = 30
    }

    "master-03" = {
      name       = "master-03"
      cores      = 4
      sockets    = 1
      memory     = 2048
      ip_address = "192.168.1.112/24"
      size       = 30
    }

    "slave-01" = {
      name       = "slave-01"
      cores      = 4
      sockets    = 1
      memory     = 1024
      ip_address = "192.168.1.113/24"
      size       = 30
    }

    "slave-02" = {
      name       = "slave-02"
      cores      = 4
      sockets    = 1
      memory     = 1024
      ip_address = "192.168.1.114/24"
      size       = 30
    }

    "nfs-server" = {
      id         = 105
      name       = "nfs-server"
      cores      = 4
      sockets    = 1
      memory     = 2048
      ip_address = "192.168.1.115/24"
      size       = 15
    }
  }
}
