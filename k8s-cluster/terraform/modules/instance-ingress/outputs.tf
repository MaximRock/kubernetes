# outputs instance ingress

output "load_balancer" {
  value = yandex_compute_instance_group.k8s-ingresses.load_balancer
}
