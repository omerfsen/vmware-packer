
cdrom_adapter_type   = "sata"
data_directory       = "data/debian"
disk_adapter_type    = "sata"
network_adapter_type = "e1000e"
iso_url              = "https://cdimage.debian.org/cdimage/archive/11.9.0/amd64/iso-dvd/debian-11.9.0-amd64-DVD-1.iso"
iso_checksum         = "sha256:56e821f30210390dd62a8fa5c983f22f0b0bd3adba5ffa8fbc71727acd8c94e7"
# guest_os_type        = "amd-debian-64"
guest_os_type        = "debian10-64"
# https://kb.vmware.com/s/article/1003746
hardware_version = 19
boot_command     = ["<wait><esc><wait>auto preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg netcfg/get_hostname={{ .Name }}<enter>"]
vm_name              = "debian_amd64"
vmx_data = {
  "cpuid.coresPerSocket"    = "2"
  "ethernet0.pciSlotNumber" = "32"
  "svga.autodetect"         = true
  "usb_xhci.present"        = true
}

destroy = false
