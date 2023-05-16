# load balancer

resource "yandex_lb_network_load_balancer" "k8s-load-balancer" {
  name = "k8s-load-balancer"

  listener {
    name = "my-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = var.lb_subnet_id_target_group
    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
        #path = "/healthz"
      }
    }
  }
}
