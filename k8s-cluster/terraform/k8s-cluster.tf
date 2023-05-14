terraform {
  required_version = ">= 0.13"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.81.0"
    }
  }
}
# Provider

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
}

module "k8s-cluster-account" {
  source = "./modules/account"
}

module "k8s-cluster-network" {
  source = "./modules/network"
}

module "k8s-instance-masters" {
  source                = "./modules/instance"
  yc_service_account_id = module.k8s-cluster-account.yc_service_account_id
  network_id            = module.k8s-cluster-network.yandex_vpc_network
  k8s_subnet_id         = module.k8s-cluster-network.subnet_ids
}
