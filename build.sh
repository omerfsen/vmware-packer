#!/bin/bash

packer init .
if [[ -f pkvars/debian/vmware-workstation.pkvars.hcl ]]
then
	PACKER_LOG=1 packer build -on-error=ask -force -var-file=pkvars/debian/vmware-workstation.pkvars.hcl .
else
	exit 3
fi
