#!/bin/bash

# set -e

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


sudo apt update && sudo apt install pip -y
mkdir ~/k8s-cluster && cd ~/k8s-cluster
git clone https://github.com/kubernetes-sigs/kubespray.git
cd ./kubespray
sudo pip install -r requirements.txt

cp -rfp inventory/sample inventory/k8s-project

cp -f ~/setup/inventory.ini ~/k8s-cluster/kubespray/inventory/inventory.ini

ssh-keygen -t rsa -N "" -f /home/admin/.ssh/rsa.key #my.key