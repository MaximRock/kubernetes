# outputs instance

# output "internal_ip_address_k8s_instance" {
#   value = yandex_compute_instance_group.k8s-masters.instances[*]
# }

# output "hostname_k8s_instance" {
#   value = yandex_compute_instance_group.k8s-masters.instances[*]
# }

output "k8s_instance" {
  value = yandex_compute_instance_group.k8s-masters.instances[*]
}
