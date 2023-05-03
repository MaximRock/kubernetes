
data "yandex_compute_image" "my_image" {
  family = var.innstance_family_image
}

resource "yandex_compute_instance" "vm-minikube" {
  count = var.minikube
  name = "minikube-${count.index}"
  hostname = "minikube-${count.index}"

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
      size = 20
      type = "network-ssd"
    }
  }

  network_interface {
    subnet_id = var.vpc_subnet_id
    nat = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "local_file" "hosts-ansible" {
  content = templatefile("./hosts.tpl",
  {
    host_0    = yandex_compute_instance.vm-minikube[0].hostname
    address_0 = yandex_compute_instance.vm-minikube[0].network_interface.0.nat_ip_address
  }
  )
  filename = "./hosts"
}