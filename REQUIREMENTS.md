Create a Linux virtual appliance that can be used to deploy a Linux system that ships metrics to cloud.opvizor.com after start:

Create a Debian/or Photon virtual appliance (ova) that can be deployed on a VMware system (Workstation or ESXi); we would like to see a script that is automatically creating the virtual machine and ova
While importing there should be a size choice for the VM (small (2vCPU, 2GB, 20GB disk) , medium (4vCPU, 4GB, 30GB disk), large (6vCPU, 8GB, 40GB disk))
During ovf import there should be a settings configurable:
hostname
ip address
netmask
gateway
dns
Opvizor/Cloud API key (register at cloud.opvizor.com to get one)
At first boot the VM settings should be used to configure the VM network automatically
The VM should also either contain telegraf already (or download the binary after first boot and network setup
The telegraf.conf should be changed to use the configured Opvizor/Cloud API key
Use packer and a VMware workstation to create and export the virtual machine to have an automated process
