# variable template

#======= master-1
variable "hostname_master_1" {
  type        = string
  description = "Yandex Cloud hostname k8s-cluster master-1"
}

variable "external_ip_address_master_1" {
  type        = string
  description = "Yandex Cloud public ip address master-1"
}

variable "internal_ip_address_master_1" {
  type        = string
  description = "Yandex Cloud privat ip address master-1"
}


#======= master-2
variable "hostname_master_2" {
  type        = string
  description = "Yandex Cloud hostname k8s-cluster master-2"
}

variable "external_ip_address_master_2" {
  type        = string
  description = "Yandex Cloud public ip address master-2"
}

variable "internal_ip_address_masters_2" {
  type        = string
  description = "Yandex Cloud privat ip address master-2"
}

#======= app-1
variable "hostname_app_1" {
  type        = string
  description = "Yandex Cloud hostname k8s-cluster app_1"
}

variable "external_ip_address_app_1" {
  type        = string
  description = "Yandex Cloud public ip address app_1"
}

variable "internal_ip_address_app_1" {
  type        = string
  description = "Yandex Cloud privat ip address app_1"
}

#======= app-2
variable "hostname_app_2" {
  type        = string
  description = "Yandex Cloud hostname k8s-cluster app_2"
}

variable "external_ip_address_app_2" {
  type        = string
  description = "Yandex Cloud public ip address app_2"
}

variable "internal_ip_address_app_2" {
  type        = string
  description = "Yandex Cloud privat ip address app_2"
}
