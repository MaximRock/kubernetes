output "internal_ip_address_minikube" {
  #value = [for vm in yandex_compute_instance.vm : vm.network_interface.0.ip_address]
  value = yandex_compute_instance.vm-minikube[*].network_interface.0.nat_ip_address
}

