# Minikube
- Для запуска проекта:

        ./setup.sh

- Запуск ansible-playbook

         ansible-playbook play.yml --tags="docker, minikube, install_deployment, helm"

## terraform
Описание инфраструктуры виртуальной машины в Yandex Cloud.

## minikube-setup
Role Ansible:
  - ### role DOCKER
    - main.yml - установка Docker
  - ### role MINIKUBE 
    - main.yml 
      - установка minikube с использованием driver VirtualBox
      - установка kubectl
      
                TASK [MINIKUBE : Print Debug] ********************************************************************************
                ok: [minikube-0] => (item=['Client Version: version.Info{Major:"1", Minor:"27", GitVersion:"v1.27.0", GitCommit:"1b4df30b3cdfeaba6024e81e559a6cd09a089d65", GitTreeState:"clean",// BuildDate:"2023-04-11T17:10:18Z", GoVersion:"go1.20.3", Compiler:"gc", Platform:"linux/amd64"}', 'Kustomize Version: v5.0.1']) => {
                    "msg": [
                        "Client Version: version.Info{Major:\"1\", Minor:\"27\", GitVersion:\"v1.27.0\", GitCommit:\"1b4df30b3cdfeaba6024e81e559a6cd09a089d65\", GitTreeState:\"clean\", BuildDate:\"2023-04-11T17:10:18Z\", GoVersion:\"go1.20.3\", Compiler:\"gc\", Platform:\"linux/amd64\"}",
                        "Kustomize Version: v5.0.1"
                    ]
                }
                ok: [minikube-0] => (item=['minikube\t192.168.49.2', 'minikube-m02\t192.168.49.3', 'minikube-m03\t192.168.49.4', 'minikube-m04\t192.168.49.5', 'minikube-m05\t192.168.49.6']) => {
                    "msg": [
                        "minikube\t192.168.49.2",
                        "minikube-m02\t192.168.49.3",
                        "minikube-m03\t192.168.49.4",
                        "minikube-m04\t192.168.49.5",
                        "minikube-m05\t192.168.49.6"
                    ]
                }

      
   - ### role DEPLOYMENT
     - main.yml - установка deployment`а 
     - file - конфигурационные файлы:
       - "deployment.yaml"
       - "configmap.yaml"
       - "service.yaml"
       - "secret.yaml"
       
                       TASK [DEPLOYMENT : Print debug] ********************************************************************
                        ok: [minikube-0] => {
                            "msg": [
                                "configmap/nginx-config created",
                                "deployment.apps/nginx-sf created",
                                "secret/sf-auth-nginx created",
                                "service/sf-webserver created"
                            ]
                        }

       
       
   - ### role HELM
     - main.yml установка helm и helm chart prometheus
     - defaults -> main.yml varibles
     
                helm_version: 'v3.11.3'
                helm_platform: 'linux'
                helm_arch: 'amd64'
                helm_repo_path: 'https://get.helm.sh'
      
      - file -> values.yaml
      
                alertmanager:
                  enabled: false

                prometheus-node-exporter:
                  enabled: false

                prometheus-pushgateway:
                  enabled: false
      ----

                
                TASK [HELM : Print helm version] *****************************************************************************
                ok: [minikube-0] => {
                    "msg": [
                        "version.BuildInfo{Version:\"v3.11.3\", GitCommit:\"323249351482b3bbfc9f5004f65d400aa70f9ae7\", GitTreeState:\"clean\", GoVersion:\"go1.20.3\"}"
                    ]
                }

                TASK [HELM : Print helm pods info] ***************************************************************************
                ok: [minikube-0] => {
                    "msg": [
                        "NAME                                             READY   STATUS             RESTARTS     AGE",
                        "prometheus-kube-state-metrics-7f6769f7c6-w7gcx   1/1     Running            0            84s",
                        "prometheus-server-67d4b87bfc-67zjt               1/2     CrashLoopBackOff   2 (8s ago)   84s"
                    ]
                }
### Screenshot                
----
![Снимок экрана от 2023-05-10 21-10-46](https://github.com/MaximRock/kubernetes/assets/95434302/41245b9c-f2d6-4c39-b27b-32bd19f7f63a)

