# k8s-cluster outputs

# output "subnet_ids" {
#   value = module.k8s-cluster-network.subnet_ids
# }

# output "yc_service_account_id" {
#   value = module.k8s-cluster-account.yc_service_account_id
# }

#================== master-1
output "internal_ip_address_k8s_instance_masters_1" {
  value = module.k8s-instance-masters.k8s_instance[0].network_interface.0.ip_address
}

output "external_ip_address_k8s_instance_masters_1" {
  value = module.k8s-instance-masters.k8s_instance[0].network_interface.0.nat_ip_address
}

output "hostname_k8s_instance_masters_1" {
  value = module.k8s-instance-masters.k8s_instance[0].name
}

#================== master-1
output "internal_ip_address_k8s_instance_masters_2" {
  value = module.k8s-instance-masters.k8s_instance[1].network_interface.0.ip_address
}

output "external_ip_address_k8s_instance_masters_2" {
  value = module.k8s-instance-masters.k8s_instance[1].network_interface.0.nat_ip_address
}

output "hostname_k8s_instance_masters_2" {
  value = module.k8s-instance-masters.k8s_instance[1].name
}

#================== app-1
output "internal_ip_address_k8s_instance_app_1" {
  value = module.k8s-instance-worker.k8s_instance[0].network_interface.0.ip_address
}

output "external_ip_address_k8s_instance_app_1" {
  value = module.k8s-instance-worker.k8s_instance[0].network_interface.0.nat_ip_address
}

output "hostname_k8s_instance_app_1" {
  value = module.k8s-instance-worker.k8s_instance[0].name
}

#================== app-2
output "internal_ip_address_k8s_instance_app_2" {
  value = module.k8s-instance-worker.k8s_instance[1].network_interface.0.ip_address
}

output "external_ip_address_k8s_instance_app_2" {
  value = module.k8s-instance-worker.k8s_instance[1].network_interface.0.nat_ip_address
}

output "hostname_k8s_instance_app_2" {
  value = module.k8s-instance-worker.k8s_instance[1].name
}

#================== srv
output "internal_ip_address_k8s_instance_srv" {
  value = module.k8s-instance-srv.k8s_instance[*].network_interface.0.ip_address
}

output "external_ip_address_k8s_instance_srv" {
  value = module.k8s-instance-srv.k8s_instance[*].network_interface.0.nat_ip_address
}
