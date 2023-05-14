resource "yandex_compute_instance_group" "k8s-masters" {
  name               = "k8s-masters"
  folder_id          = var.yc_folder_id
  service_account_id = var.yc_service_account_id

  instance_template {
    name = "master-{instance.index}"

    resources {
      memory        = 2
      cores         = 2
      core_fraction = 20
    }

    boot_disk {
      initialize_params {
        image_id = "fd8r9ntkrnrn46fkh0e4" # ubuntu 22.04
        size     = 10
        type     = "network-ssd"
      }
    }

    network_interface {
      network_id = var.network_id
      subnet_ids = var.k8s_subnet_id
      nat        = true
    }

    metadata = {
      user-data = "${file("./meta.txt")}"
    }

    network_settings {
      type = "STANDARD"
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = [
      "ru-central1-a",
      "ru-central1-b",
      "ru-central1-c",

    ]
  }

  deploy_policy {
    max_unavailable = 3
    max_creating    = 3
    max_expansion   = 3
    max_deleting    = 3
  }
}
