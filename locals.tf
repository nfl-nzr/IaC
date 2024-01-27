locals {
  vms = {
    "master-01" = {
      name       = "master-01"
      cores      = 2
      sockets    = 1
      memory     = 2048
      ip_address = "192.168.1.110/24"
      size       = 20
    }

    "master-02" = {
      name       = "master-02"
      cores      = 2
      sockets    = 1
      memory     = 2048
      ip_address = "192.168.1.111/24"
      size       = 20
    }

     "master-03" = {
      name       = "master-03"
      cores      = 2
      sockets    = 1
      memory     = 2048
      ip_address = "192.168.1.112/24"
      size       = 20
    }

    "slave-01" = {
      name       = "slave-01"
      cores      = 2
      sockets    = 1
      memory     = 2048
      ip_address = "192.168.1.113/24"
      size       = 20
    }

    "slave-02" = {
      name       = "slave-02"
      cores      = 2
      sockets    = 1
      memory     = 2048
      ip_address = "192.168.1.114/24"
      size       = 20
    }
  }
}
