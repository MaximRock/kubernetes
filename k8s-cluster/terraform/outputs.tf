# k8s-cluster

output "subnet_ids" {
  value = module.k8s-cluster-network.subnet_ids
}

output "yc_service_account_id" {
  value = module.k8s-cluster-account.yc_service_account_id
}
