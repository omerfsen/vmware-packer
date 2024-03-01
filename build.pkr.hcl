# https://github.com/iancmcc/packer-post-processor-ovftool
# https://elatov.github.io/2018/11/use-packer-with-vmware-player-to-build-an-ova/
packer {
  required_version = ">= 1.7.0"
  required_plugins {
    vmware = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

build {
  sources = ["source.vmware-iso.debian"]

  provisioner "file" {
    source      = "files/setup.sh"
    destination = "/tmp/setup.sh"
  }

  provisioner "shell" {
    inline = ["sudo mv /tmp/setup.sh /root/setup.sh"]
  }

  provisioner "file" {
    source      = "files/rc.local"
    destination = "/tmp/rc.local"
  }

  provisioner "shell" {
    inline = ["sudo mv /tmp/rc.local /etc/rc.local"]
  }

  provisioner "shell" {
    # make ova_cleanup.sh to be last to run
    scripts      = ["scripts/configure_vm.sh", "scripts/ova_cleanup.sh"]
    pause_before = "5s"
  }

  provisioner "file" {
    source      = "files/telegraf.conf"
    destination = "/tmp/telegraf.conf"
  }

  provisioner "shell" {
    inline = ["sudo mv /tmp/telegraf.conf  /etc/telegraf/telegraf.conf"]
  }

  post-processors {
    # Create ovf first
    post-processor "shell-local" {
      # inline = ["ovftool --compress=9 --makeDeltaDisks builds/${var.vm_name}/packer-debian.vmx ${var.vm_name}.ova"]
      inline = ["ovftool --acceptAllEulas --allowAllExtraConfig builds/${var.vm_name}/packer-debian.vmx builds/ova/${var.vm_name}.ovf"]
    }

    post-processor "shell-local" { # sleep 120 for debug
      environment_vars = ["VM_NAME=${var.vm_name}"]
      inline = [
        "cd scripts",
        "./add_ovf_properties.sh"
      ]
    }

    post-processor "shell-local" {
      # inline = ["ovftool --compress=9 --makeDeltaDisks builds/${var.vm_name}/packer-debian.vmx ${var.vm_name}.ova"]
      # inline = ["ovftool --compress=9 --acceptAllEulas --allowAllExtraConfig builds/ova/${var.vm_name}.ovf builds/ova/${var.vm_name}.ova "]
      inline = ["ovftool --acceptAllEulas --allowAllExtraConfig builds/ova/${var.vm_name}.ovf builds/ova/${var.vm_name}.ova "]
    }
  }
}
