# variables loade balancer

variable "lb_target_group_id" {
  type        = string
  description = "Yandex Cloud load balacer targetgroup id"
}

variable "lb_subnet_id_target_group" {
  type = string
}
