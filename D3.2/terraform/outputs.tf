output "internal_ip_address_minikube" {
  value = module.minikube-cluster[*].internal_ip_address_minikube
}

