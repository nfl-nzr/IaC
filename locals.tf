locals {

  ec2_instances = {
    "jump_server" = {
      instance_name               = "jump-server"
      key_name                    = "deployer-key"
      network_security_group_name = "nsg-inbound"
      instance_type               = "t2.micro"
      allowed_ingress_cidrs =    [
          "173.245.48.0/20",
          "103.21.244.0/22",
          "103.22.200.0/22",
          "103.31.4.0/22",
          "141.101.64.0/18",
          "108.162.192.0/18",
          "190.93.240.0/20",
          "188.114.96.0/20",
          "197.234.240.0/22",
          "198.41.128.0/17",
          "162.158.0.0/15",
          "104.16.0.0/13",
          "104.24.0.0/14",
          "172.64.0.0/13",
          "131.0.72.0/22"
      ]
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
