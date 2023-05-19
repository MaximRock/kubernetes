#!/bin/bash

set -e

mkdir kubespray_demo && cd ./kubespray_demo
sudo apt update 
sudo apt install pip -y && sudo apt install python3-virtualenv -y

virtualenv venv
source sutupvenv.sh

git clone https://github.com/kubernetes-sigs/kubespray.git

cd kubespray/
sudo pip install -r requirements.txt

ssh-keygen -t rsa -N "" -f my.key
cp -rfp inventory/sample inventory/mycluster