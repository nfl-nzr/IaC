locals {
  vms = {
    "master-01" = {
      name      = "master-01"
      cores     = 2
      sockets   = 1
      memory    = 2048
      ipconfig0 = "ip=192.168.1.110/24,gw=192.168.1.1"
      size      = "20"
    }

    "master-02" = {
      name      = "master-01"
      cores     = 2
      sockets   = 1
      memory    = 2048
      ipconfig0 = "ip=192.168.1.111/24,gw=192.168.1.1"
      size      = "20"
    }

    "slave-01" = {
      name      = "master-01"
      cores     = 4
      sockets   = 2
      memory    = 2048
      ipconfig0 = "ip=192.168.1.113/24,gw=192.168.1.1"
      size      = "20"
    }

    "slave-02" = {
      name      = "master-01"
      cores     = 1
      sockets   = 1
      memory    = 2048
      ipconfig0 = "ip=192.168.1.114/24,gw=192.168.1.1"
      size      = "20"
    }
  }
}
