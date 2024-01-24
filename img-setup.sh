#wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

# Create a VM
qm create 9000 --name nfl.ubuntu2204.cloud.image --cpu host --cores 2 --sockets 1 --memory 2048 --net0 virtio,bridge=vmbr1

# Import the disk in qcow2 format (as unused disk) 
qm importdisk 9000 jammy-server-cloudimg-amd64.img storage -format qcow2

# Attach the disk to the vm using VirtIO SCSI
qm set 9000 --scsihw virtio-scsi-pci --scsi0 /mnt/pve/storage/images/9000/vm-9000-disk-0.qcow2

# Important settings
qm set 9000 --ide2 storage:cloudinit --boot c --bootdisk scsi0 --serial0 socket --vga serial0

# The initial disk is only 2GB, thus we make it larger
qm resize 9000 scsi0 +15G

# Using static IP
qm set 9000 --ipconfig0 ip=192.168.1.60/24,gw=192.168.1.1

# user authentication for 'ubuntu' user (optional password)
qm set 9000 --cipassword 0000

# check the cloud-init config
qm cloudinit dump 9000 user

# create tempalte and a linked clone
qm template 9000
qm clone 9000 190 --name master-01
qm start 190
