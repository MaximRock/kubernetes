#!/bin/bash

# переходим в директорию
cd ./terraform > /dev/null 2>&1

# выполняем terraform apply без ввода yes
terraform apply -auto-approve

# ждем 60 секунд пока поднимется наш instans
sleep 60s > /dev/null 2>&1

# переходим в директорию
cd .. && cd ./minikube-setup > /dev/null 2>&1

# запускаем ansible-playbook 
ansible-playbook play.yml --tags="docker, minikube, install_deployment, helm"
