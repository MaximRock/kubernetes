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
  source                   = "./modules/instance"
  yc_service_account_id    = module.k8s-cluster-account.yc_service_account_id
  network_id               = module.k8s-cluster-network.yandex_vpc_network
  k8s_subnet_id            = module.k8s-cluster-network.subnet_ids
  instance_group_name      = "masters"
  name_instance            = "master"
  boot_disk_type           = "network-ssd"
  scale_policy_size        = 3
  max_unavailable_quantity = 3
  max_creating_quantity    = 3
  max_expansion_quantity   = 3
  max_deleting_quantity    = 3
}

module "k8s-instance-worker" {
  source                   = "./modules/instance"
  yc_service_account_id    = module.k8s-cluster-account.yc_service_account_id
  network_id               = module.k8s-cluster-network.yandex_vpc_network
  k8s_subnet_id            = module.k8s-cluster-network.subnet_ids
  instance_group_name      = "workers"
  name_instance            = "worker"
  boot_disk_type           = "network-hdd"
  scale_policy_size        = 2
  max_unavailable_quantity = 3
  max_creating_quantity    = 3
  max_expansion_quantity   = 3
  max_deleting_quantity    = 3
}

module "k8s-instance-ingresses" {
  source                   = "./modules/instance"
  yc_service_account_id    = module.k8s-cluster-account.yc_service_account_id
  network_id               = module.k8s-cluster-network.yandex_vpc_network
  k8s_subnet_id            = module.k8s-cluster-network.subnet_ids
  instance_group_name      = "ingresses"
  name_instance            = "ingresses"
  boot_disk_type           = "network-hdd"
  scale_policy_size        = 2
  max_unavailable_quantity = 2
  max_creating_quantity    = 2
  max_expansion_quantity   = 2
  max_deleting_quantity    = 2
}

module "k8s-load-balancer" {
  source             = "./modules/load-balancer"
  lb_target_group_id = module.k8s-instance-ingresses.load_balancer.0.target_group_id
}
