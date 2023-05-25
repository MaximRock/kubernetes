#!/bin/bash

set -e

ssh-keygen -m PEM -t rsa -b 4096 -C "admin@srv-1" -f my.key -N ""

terraform init
terraform apply -auto-approve


# mkdir kubespray_demo && cd ./kubespray_demo
# sudo apt update 
# sudo apt install pip -y && sudo apt install python3-virtualenv -y

# ssh-keygen -t rsa -N "" -f #my.key

# virtualenv venv
# source sutupvenv.sh

# git clone https://github.com/kubernetes-sigs/kubespray.git

# cd kubespray/
# sudo pip install -r requirements.txt

# ssh-keygen -t rsa -N "" -f my.key
# cp -rfp inventory/sample inventory/mycluster


# sudo apt update && sudo apt install pip -y
# mkdir ~/k8s-cluster && cd ~/k8s-cluster
# git clone https://github.com/kubernetes-sigs/kubespray.git
# cd ./kubespray
# sudo pip install -r requirements.txt

# cp -rfp inventory/sample inventory/k8s-project

# cp -f ~/setup/inventory.ini ~/k8s-cluster/kubespray/inventory/inventory.ini

# ssh-keygen -t ssh-keygen -t ed25519 -N "" -f /home/admin/.ssh/id_ed25519 #my.key


#ansible-playbook -i inventory/mycluster/inventory.ini  --become --become-user=root cluster.yml

#ssh-keygen -m PEM -t rsa -b 4096 -C "admin@srv-1" -f my.key -N ""