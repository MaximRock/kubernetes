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
  instance_group_name      = "k8s-masters"
  name_instance            = "master"
  memory_size              = 2
  cores_size               = 2
  core_fraction_size       = 20
  boot_disk_image          = "fd8r9ntkrnrn46fkh0e4" # ubuntu 22.04
  boot_disk_size           = 10
  boot_disk_type           = "network-ssd"
  scale_policy_size        = 2
  max_unavailable_quantity = 2
  max_creating_quantity    = 2
  max_expansion_quantity   = 2
  max_deleting_quantity    = 2
  depends_on               = [module.k8s-cluster-account, module.k8s-cluster-network]
}

module "k8s-instance-worker" {
  source                   = "./modules/instance"
  yc_service_account_id    = module.k8s-cluster-account.yc_service_account_id
  network_id               = module.k8s-cluster-network.yandex_vpc_network
  k8s_subnet_id            = module.k8s-cluster-network.subnet_ids
  instance_group_name      = "k8s-workers"
  name_instance            = "app"
  memory_size              = 2
  cores_size               = 2
  core_fraction_size       = 20
  boot_disk_image          = "fd8r9ntkrnrn46fkh0e4" # ubuntu 22.04
  boot_disk_size           = 10
  boot_disk_type           = "network-hdd"
  scale_policy_size        = 2
  max_unavailable_quantity = 2
  max_creating_quantity    = 2
  max_expansion_quantity   = 2
  max_deleting_quantity    = 2
  depends_on               = [module.k8s-cluster-account, module.k8s-cluster-network]
}

module "k8s-instance-srv" {
  source                   = "./modules/instance"
  yc_service_account_id    = module.k8s-cluster-account.yc_service_account_id
  network_id               = module.k8s-cluster-network.yandex_vpc_network
  k8s_subnet_id            = module.k8s-cluster-network.subnet_ids
  instance_group_name      = "k8s-server"
  name_instance            = "srv"
  memory_size              = 8
  cores_size               = 4
  core_fraction_size       = 100
  boot_disk_image          = "fd8r9ntkrnrn46fkh0e4" # ubuntu 22.04
  boot_disk_size           = 15
  boot_disk_type           = "network-ssd"
  scale_policy_size        = 1
  max_unavailable_quantity = 1
  max_creating_quantity    = 1
  max_expansion_quantity   = 1
  max_deleting_quantity    = 1
  depends_on               = [module.k8s-cluster-account, module.k8s-cluster-network]
}

module "k8s-template" {
  source                        = "./modules/template"
  hostname_master_1             = module.k8s-instance-masters.k8s_instance[0].name
  external_ip_address_master_1  = module.k8s-instance-masters.k8s_instance[0].network_interface.0.nat_ip_address
  internal_ip_address_master_1  = module.k8s-instance-masters.k8s_instance[0].network_interface.0.ip_address
  hostname_master_2             = module.k8s-instance-masters.k8s_instance[1].name
  external_ip_address_master_2  = module.k8s-instance-masters.k8s_instance[1].network_interface.0.nat_ip_address
  internal_ip_address_masters_2 = module.k8s-instance-masters.k8s_instance[1].network_interface.0.ip_address
  hostname_app_1                = module.k8s-instance-worker.k8s_instance[0].name
  external_ip_address_app_1     = module.k8s-instance-worker.k8s_instance[0].network_interface.0.nat_ip_address
  internal_ip_address_app_1     = module.k8s-instance-worker.k8s_instance[0].network_interface.0.ip_address
  hostname_app_2                = module.k8s-instance-worker.k8s_instance[1].name
  external_ip_address_app_2     = module.k8s-instance-worker.k8s_instance[1].network_interface.0.nat_ip_address
  internal_ip_address_app_2     = module.k8s-instance-worker.k8s_instance[1].network_interface.0.ip_address

  depends_on = [module.k8s-cluster-account, module.k8s-cluster-network, module.k8s-instance-masters, module.k8s-instance-worker]
}

module "k8s-provisioning" {
  source               = "./modules/provisioning"
  hostname_srv_instans = module.k8s-instance-srv.k8s_instance[0].network_interface.0.nat_ip_address

  depends_on = [module.k8s-cluster-account, module.k8s-cluster-network, module.k8s-instance-masters, module.k8s-instance-worker, module.k8s-template]
}


# module "k8s-instance-ingresses" {
#   source                   = "./modules/instance-ingress"
#   yc_service_account_id    = module.k8s-cluster-account.yc_service_account_id
#   network_id               = module.k8s-cluster-network.yandex_vpc_network
#   k8s_subnet_id            = module.k8s-cluster-network.subnet_ids
#   instance_group_name      = "k8s-ingresses"
#   name_instance            = "ingress"
#   boot_disk_type           = "network-hdd"
#   scale_policy_size        = 2
#   max_unavailable_quantity = 2
#   max_creating_quantity    = 2
#   max_expansion_quantity   = 2
#   max_deleting_quantity    = 2
#   depends_on               = [module.k8s-cluster-account, module.k8s-cluster-network]
# }

# module "k8s-load-balancer" {
#   source                    = "./modules/load-balancer"
#   lb_subnet_id_target_group = module.k8s-instance-ingresses.load_balancer.0.target_group_id
#   depends_on                = [module.k8s-instance-ingresses]
# }

