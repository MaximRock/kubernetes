# Network

resource "yandex_vpc_network" "k8s-network" {
  name = "k8s-network"
}

resource "yandex_vpc_subnet" "k8s-subnet" {
  count          = length(var.name_subnet)
  name           = element(var.name_subnet, count.index) #"k8s-subnet-1"
  zone           = element(var.zone, count.index)        #"ru-central1-a"
  network_id     = yandex_vpc_network.k8s-network.id
  v4_cidr_blocks = ["192.168.${count.index + 1}0.0/24"]
}


