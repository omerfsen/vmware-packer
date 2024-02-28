

curl -O http://ovh.serra.pw/iso/vmware/VMware-Workstation-Full-16.2.5-20904516.x86_64.bundle
sudo VMware-Workstation-Full-16.2.5-20904516.x86_64.bundle --console --eulas-agreed

sudo dpkg --configure -a


curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer
packer plugins install github.com/hashicorp/vmware


wget -O ${HOME}/ovftool.zip  https://vdc-download.vmware.com/vmwb-repository/dcr-public/2ee5a010-babf-450b-ab53-fb2fa4de79af/2a136212-2f83-4f5d-a419-232f34dc08cf/VMware-ovftool-4.4.3-18663434-lin.x86_64.zip
cd ${HOME} ; unzip ovftool.zip
echo 'export PATH=$PATH:${HOME}/ovftool' >> ${HOME}/.bashrc
source  ${HOME}/.bashrc
