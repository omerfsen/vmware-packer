# packer

## Install PreReqs

```bash

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer

packer plugins install github.com/hashicorp/vmware

```

Then run

```bash
./build.sh
```
