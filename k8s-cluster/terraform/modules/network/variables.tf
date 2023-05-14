# Network variable

variable "name_subnet" {
  default = [
    "k8s-subnet-1",
    "k8s-subnet-2",
    "k8s-subnet-3",
  ]
}

variable "zone" {
  default = [
    "ru-central1-a",
    "ru-central1-b",
    "ru-central1-c",
  ]
}

# variable "network_id" {
#   default = yandex_vpc_network.k8s-network.id
# }

variable "v4_cidr" {
  default = [
    "192.168.10.0/24",
    "192.168.20.0/24",
    "192.168.30.0/24",
  ]
}
