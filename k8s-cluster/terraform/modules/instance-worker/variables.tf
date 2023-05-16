# varibles instance group workers

variable "yc_folder_id" {
  type        = string
  description = "Yndex Cloud folder id"
  default     = ""
}

variable "yc_service_account_id" {
  type        = string
  description = "Yndex cloud service account id"
}

variable "network_id" {
  type        = string
  description = "Yandex Cloud vpc network id"
}

variable "k8s_subnet_id" {
  description = "Yandex Cloud vpc network subnet id"
}

variable "name_instance" {
  type        = string
  description = "Yandex Cloud instance template group name"
}

variable "instance_group_name" {
  type        = string
  description = "Yandex Cloud instance group name"
}

variable "scale_policy_size" {
  type        = number
  description = "Yandex Cloud instance group scale policy size"
}

variable "boot_disk_type" {
  type        = string
  description = "Yandex Cloud instance group boot disk type"
}

variable "max_unavailable_quantity" {
  type        = number
  description = "Yandex Cloud instance group max unavailable"
}

variable "max_creating_quantity" {
  type        = number
  description = "Yandex Cloud instance group max creating"
}

variable "max_expansion_quantity" {
  type        = number
  description = "Yandex Cloud instance group max expansion"
}

variable "max_deleting_quantity" {
  type        = number
  description = "Yandex Cloud instance group max deleting"
}
