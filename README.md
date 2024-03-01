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
    vmware-iso.debian: Deleting previous output directory...
==> vmware-iso.debian: Creating required virtual machine disks
==> vmware-iso.debian: Building and writing VMX file
==> vmware-iso.debian: Starting HTTP server on port 8937
==> vmware-iso.debian: Creating temporary RSA SSH key for instance...
==> vmware-iso.debian: Starting virtual machine...
    vmware-iso.debian: The VM will be run headless, without a GUI. If you want to
    vmware-iso.debian: view the screen of the VM, connect via VNC with the password "ksdEDINV" to
    vmware-iso.debian: vnc://127.0.0.1:5941
==> vmware-iso.debian: Connecting to VNC...
==> vmware-iso.debian: Waiting 10s for boot...
==> vmware-iso.debian: Typing the boot command over VNC...
==> vmware-iso.debian: Waiting for SSH to become available...
==> vmware-iso.debian: Connected to SSH!
==> vmware-iso.debian: Uploading files/setup.sh => /tmp/setup.sh
    vmware-iso.debian: setup.sh 3.88 KiB / 3.88 KiB [=================================================================================================================================] 100.00% 0s
==> vmware-iso.debian: Provisioning with shell script: /tmp/packer-shell1697866688
==> vmware-iso.debian: Uploading files/rc.local => /tmp/rc.local
    vmware-iso.debian: rc.local 123 B / 123 B [=======================================================================================================================================] 100.00% 0s
==> vmware-iso.debian: Provisioning with shell script: /tmp/packer-shell1237801721
==> vmware-iso.debian: Pausing 5s before the next provisioner...
==> vmware-iso.debian: Provisioning with shell script: scripts/configure_vm.sh
    vmware-iso.debian: Installing Telegraph
    vmware-iso.debian: influxdata-archive_compat.key: OK
    vmware-iso.debian: deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main
    vmware-iso.debian: Hit:1 http://security.debian.org/debian-security bullseye-security InRelease
    vmware-iso.debian: Hit:2 http://httpredir.debian.org/debian bullseye InRelease
    vmware-iso.debian: Hit:3 http://httpredir.debian.org/debian bullseye-updates InRelease
    vmware-iso.debian: Get:4 https://repos.influxdata.com/debian stable InRelease [6,901 B]
    vmware-iso.debian: Get:5 https://repos.influxdata.com/debian stable/main amd64 Packages [9,149 B]
    vmware-iso.debian: Fetched 16.1 kB in 1s (26.3 kB/s)
    vmware-iso.debian: Reading package lists...
    vmware-iso.debian: Reading package lists...
    vmware-iso.debian: Building dependency tree...
    vmware-iso.debian: Reading state information...
    vmware-iso.debian: open-vm-tools is already the newest version (2:11.2.5-2+deb11u3).
    vmware-iso.debian: The following NEW packages will be installed:
    vmware-iso.debian:   telegraf
    vmware-iso.debian: 0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
    vmware-iso.debian: Need to get 61.2 MB of archives.
    vmware-iso.debian: After this operation, 228 MB of additional disk space will be used.
    vmware-iso.debian: Get:1 https://repos.influxdata.com/debian stable/main amd64 telegraf amd64 1.29.5-1 [61.2 MB]
    vmware-iso.debian: Fetched 61.2 MB in 2s (33.3 MB/s)
    vmware-iso.debian: Selecting previously unselected package telegraf.
    vmware-iso.debian: (Reading database ... 53976 files and directories currently installed.)
    vmware-iso.debian: Preparing to unpack .../telegraf_1.29.5-1_amd64.deb ...
    vmware-iso.debian: Unpacking telegraf (1.29.5-1) ...
    vmware-iso.debian: Setting up telegraf (1.29.5-1) ...
    vmware-iso.debian: Created symlink /etc/systemd/system/multi-user.target.wants/telegraf.service → /lib/systemd/system/telegraf.service.
    vmware-iso.debian: Updating all packages
    vmware-iso.debian: Reading package lists...
    vmware-iso.debian: Building dependency tree...
    vmware-iso.debian: Reading state information...
    vmware-iso.debian: Calculating upgrade...
    vmware-iso.debian: 0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
    vmware-iso.debian: Restarting rc-local service so new rc.local takes affect
==> vmware-iso.debian: Provisioning with shell script: scripts/ova_cleanup.sh
==> vmware-iso.debian: + sudo apt-get clean all
==> vmware-iso.debian: Uploading files/telegraf.conf => /tmp/telegraf.conf
    vmware-iso.debian: telegraf.conf 2.56 KiB / 2.56 KiB [============================================================================================================================] 100.00% 0s
==> vmware-iso.debian: Provisioning with shell script: /tmp/packer-shell1005896351
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
==> vmware-iso.debian (shell-local): Running local shell script: /tmp/packer-shell3179507590
    vmware-iso.debian (shell-local): Opening VMX source: builds/debian_amd64/packer-debian.vmx
    vmware-iso.debian (shell-local): Opening OVF target: builds/ova/debian_amd64.ovf
    vmware-iso.debian (shell-local): Writing OVF package: builds/ova/debian_amd64.ovf
    vmware-iso.debian (shell-local): Transfer Completed
    vmware-iso.debian (shell-local): Completed successfully
==> vmware-iso.debian: Running post-processor:  (type shell-local)
==> vmware-iso.debian (shell-local): Running local shell script: /tmp/packer-shell4089420326
==> vmware-iso.debian: Running post-processor:  (type shell-local)
==> vmware-iso.debian (shell-local): Running local shell script: /tmp/packer-shell2371496509
    vmware-iso.debian (shell-local): Opening OVF source: builds/ova/debian_amd64.ovf
    vmware-iso.debian (shell-local): The manifest validates
    vmware-iso.debian (shell-local): Opening OVA target: builds/ova/debian_amd64.ova
    vmware-iso.debian (shell-local): Writing OVA package: builds/ova/debian_amd64.ova
    vmware-iso.debian (shell-local): Transfer Completed
    vmware-iso.debian (shell-local): Warning:
    vmware-iso.debian (shell-local):  - Wrong file size specified in OVF descriptor for 'debian_amd64-disk1.vmdk' (specified: 968894464, actual 972006912).
    vmware-iso.debian (shell-local): Completed successfully
Build 'vmware-iso.debian' finished after 8 minutes 46 seconds.

==> Wait completed after 8 minutes 46 seconds

==> Builds finished. The artifacts of successful builds are:
--> vmware-iso.debian: VM files in directory: builds/debian_amd64
--> vmware-iso.debian: VM files in directory: builds/debian_amd64
--> vmware-iso.debian: VM files in directory: builds/debian_amd64
--> vmware-iso.debian: VM files in directory: builds/debian_amd64
```
