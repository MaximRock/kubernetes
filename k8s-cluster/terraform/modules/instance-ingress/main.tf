# instance ingress

resource "yandex_compute_instance_group" "k8s-masters" {
  name               = var.instance_group_name
  folder_id          = var.yc_folder_id
  service_account_id = var.yc_service_account_id

  load_balancer {
    target_group_name = "k8s-lb-ingresses"
  }

  instance_template {
    name = "${var.name_instance}-{instance.index}"

    resources {
      memory        = 2
      cores         = 2
      core_fraction = 20
    }

    boot_disk {
      initialize_params {
        image_id = "fd8r9ntkrnrn46fkh0e4" # ubuntu 22.04
        size     = 10
        type     = var.boot_disk_type
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
      size = var.scale_policy_size
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
    max_unavailable = var.max_unavailable_quantity
    max_creating    = var.max_creating_quantity
    max_expansion   = var.max_expansion_quantity
    max_deleting    = var.max_deleting_quantity
  }
}
