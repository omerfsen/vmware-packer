#!/bin/bash

packer init .
if [[ -f pkvars/debian/vmware-workstation.pkvars.hcl ]]
then
	if [[ $( ls builds/ova/debian_amd64* ) ]] 
	then
		mkdir builds/ova/$(date "+%Y-%m-%d-%H-%M")/
		mv builds/ova/*.ov*   builds/ova/$(date "+%Y-%m-%d-%H-%M")/
		mv builds/ova/*.vmdk  builds/ova/$(date "+%Y-%m-%d-%H-%M")/
		mv builds/ova/*.mf    builds/ova/$(date "+%Y-%m-%d-%H-%M")/
		
	fi
	# PACKER_LOG=1 packer build -on-error=ask -force -var-file=pkvars/debian/vmware-workstation.pkvars.hcl .
	packer build -on-error=ask -force -var-file=pkvars/debian/vmware-workstation.pkvars.hcl .
else
	exit 3
fi
