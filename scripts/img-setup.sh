apt update -y && apt install libguestfs-tools -y

# Download image
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

# Install qemu-guest-agent on the image. Additional packages can be specified by separating with a comma.
virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent

# Read and set root user password. TODO move passwd to file
virt-customize -a jammy-server-cloudimg-amd64.img --root-password password:0000

# Create an additional user.
virt-customize -a jammy-server-cloudimg-amd64.img --run-command "useradd -m -s /bin/bash nfx"

# Set password for that user.
virt-customize -a jammy-server-cloudimg-amd64.img --password nfx:password:0000

# Delete temporary password files safely.
# shred -uv password_root.txt password_myuser.txt

# Update all packages in the image.
virt-customize -a jammy-server-cloudimg-amd64.img --update

# Create VM
qm create 9000 --name "ubuntu-20.04-template" --memory 2048 --cores 2 --cpu host --sockets 1 --net0 virtio,bridge=vmbr0

# Import disk in qcow2 format
qm importdisk 9000 jammy-server-cloudimg-amd64.img storage -format qcow2

# Configure disks
qm set 9000 --scsihw virtio-scsi-pci --scsi0 storage:9000/vm-9000-disk-0.qcow2

# Resize does not work without this. Bug?
sleep 20

# Resize as the initial disk is 2G
qm resize 9000 scsi0 +15G

qm set 9000 --boot c --bootdisk scsi0

qm set 9000 --ide2 storage:cloudinit
qm set 9000 --serial0 socket --vga serial0

# Enable qemu agent
qm set 9000 --agent enabled=1

qm template 9000

rm jammy-server-cloudimg-amd64.img