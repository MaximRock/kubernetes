output "yandex_vpc_network" {
  value = yandex_vpc_network.k8s-network.id
}

output "subnet_ids" {
  value = yandex_vpc_subnet.k8s-subnet[*].id
}
