# packer

## Install PreReqs

1. Install Ubuntu 22.04

2. Run bootstrap.sh to install prerequisites

```bash
sudo ./bootstrap.sh
```

3. Then run following packer script

```bash
./build.sh

vmware-iso.debian: output will be in this color.

==> vmware-iso.debian: Retrieving ISO
==> vmware-iso.debian: Trying https://cdimage.debian.org/cdimage/archive/11.9.0/amd64/iso-dvd/debian-11.9.0-amd64-DVD-1.iso
==> vmware-iso.debian: Trying https://cdimage.debian.org/cdimage/archive/11.9.0/amd64/iso-dvd/debian-11.9.0-amd64-DVD-1.iso?checksum=sha256%3A56e821f30210390dd62a8fa5c983f22f0b0bd3adba5ffa8fbc71727acd8c94e7
==> vmware-iso.debian: https://cdimage.debian.org/cdimage/archive/11.9.0/amd64/iso-dvd/debian-11.9.0-amd64-DVD-1.iso?checksum=sha256%3A56e821f30210390dd62a8fa5c983f22f0b0bd3adba5ffa8fbc71727acd8c94e7 => /home/serra/.cache/packer/cb0e4401f6456e88e17ea6c7f25011b0c6da7ecf.iso
==> vmware-iso.debian: Configuring output and export directories...
==> vmware-iso.debian: Creating required virtual machine disks
==> vmware-iso.debian: Building and writing VMX file
==> vmware-iso.debian: Starting HTTP server on port 8624
==> vmware-iso.debian: Creating temporary RSA SSH key for instance...
==> vmware-iso.debian: Starting virtual machine...
    vmware-iso.debian: The VM will be run headless, without a GUI. If you want to
    vmware-iso.debian: view the screen of the VM, connect via VNC with the password "44l8VXvb" to
    vmware-iso.debian: vnc://127.0.0.1:5918
==> vmware-iso.debian: Connecting to VNC...
==> vmware-iso.debian: Waiting 10s for boot...
==> vmware-iso.debian: Typing the boot command over VNC...
==> vmware-iso.debian: Waiting for SSH to become available...
==> vmware-iso.debian: Connected to SSH!
==> vmware-iso.debian: Gracefully halting virtual machine...
    vmware-iso.debian: Waiting for VMware to clean up after itself...
==> vmware-iso.debian: Deleting unnecessary VMware files...
    vmware-iso.debian: Deleting: builds/debian_amd64/vm.scoreboard
    vmware-iso.debian: Deleting: builds/debian_amd64/vmware.log
==> vmware-iso.debian: Compacting all attached virtual disks...
    vmware-iso.debian: Compacting virtual disk 1
==> vmware-iso.debian: Cleaning VMX prior to finishing up...
    vmware-iso.debian: Detaching ISO from CD-ROM device sata0:1...
    vmware-iso.debian: Disabling VNC server...
==> vmware-iso.debian: Skipping export of virtual machine...
==> vmware-iso.debian: Running post-processor:  (type shell-local)
==> vmware-iso.debian (shell-local): Running local shell script: /tmp/packer-shell1548557800
    vmware-iso.debian (shell-local): Opening VMX source: builds/debian_amd64/packer-debian.vmx
    vmware-iso.debian (shell-local): Opening OVA target: debian11.ova
    vmware-iso.debian (shell-local): Writing OVA package: debian11.ova
    vmware-iso.debian (shell-local): Transfer Completed
    vmware-iso.debian (shell-local): Completed successfully
Build 'vmware-iso.debian' finished after 8 minutes 14 seconds.

==> Wait completed after 8 minutes 14 seconds

==> Builds finished. The artifacts of successful builds are:
--> vmware-iso.debian: VM files in directory: builds/debian_amd64
--> vmware-iso.debian: VM files in directory: builds/debian_amd64

```
