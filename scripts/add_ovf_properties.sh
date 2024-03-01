#!/bin/bash


if [[ ! -z ${VM_NAME} ]]
then 
	#sed -i "/    <\/VirtualHardwareSection>/ r properties.xml" ../builds/ova/${VM_NAME}.ovf
	rm -f ../builds/ova/${VM_NAME}.ovf

	cp -f default.ovf.template ../builds/ova/${VM_NAME}.ovf

	sed  -i \
	     -e 's/{{VM_NAME}}/'${VM_NAME}'/' \
	     ../builds/ova/${VM_NAME}.ovf

	rm -f  ../builds/ova/${VM_NAME}.mf
	cd ../builds/ova/
	#Creating mf file with updated ovf file
	openssl sha256 *.vmdk *.ovf > ${VM_NAME}.mf
else
	echo "NO VM_NAME defined"
	exit 1
fi
