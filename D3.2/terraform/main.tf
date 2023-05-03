terraform {
  required_version = ">= 0.13"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.81.0"
    }
  }
}  

provider "yandex" {
  token     = "token"
  cloud_id  = "cloud_id"
  folder_id = "folder_id"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "network" {
  name = "minikube-network"
}

resource "yandex_vpc_subnet" "subnet" {
  name = "subnet-1"
  zone = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.28.10.0/24"]
}

module "minikube-cluster" {
  source = "./modules/instance"
  vpc_subnet_id = yandex_vpc_subnet.subnet.id
  minikube      = 1  
}
