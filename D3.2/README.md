----
- Для запуска проекта:
        ./setup.sh

- директория terraform - установка instance;
- директория minikube-setup - ansible plyaybook с установкой docker, minikube, kubectl, deployment;
- config file deployment в директории: minikube-setup/DEPLOYMENT/file/
- Запуск plyabook'а 
             - "ansible-playbook play.yml --tags="docker, minikube, install_deployment"
