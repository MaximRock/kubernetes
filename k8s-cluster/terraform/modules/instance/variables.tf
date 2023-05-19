# varibles instance

#====== yandex_compute_instance_group =================
variable "yc_folder_id" {
  type        = string
  description = "Yndex Cloud folder id"
  default     = ""
}

variable "yc_service_account_id" {
  type        = string
  description = "Yndex cloud service account id"
}

variable "instance_group_name" {
  type        = string
  description = "Yandex Cloud instance group name"
}

#===== instance_template ==============================
#===== resources

variable "name_instance" {
  type        = string
  description = "Yandex Cloud instance template group name"
}

variable "memory_size" {
  type        = number
  description = "Yandex Cloud memory size"
}

variable "cores_size" {
  type        = number
  description = "Yandex Cloud cores size"
}

variable "core_fraction_size" {
  type        = number
  description = "Yandex Cloud core fraction size"
}

#====== boot_disk

variable "boot_disk_image" {
  type        = string
  description = "Yandex Cloud boot disk image"
}

variable "boot_disk_size" {
  type        = number
  description = "Yandex Cloud boot disk size"
}

variable "boot_disk_type" {
  type        = string
  description = "Yandex Cloud instance group boot disk type"
}

#===== network_interface

variable "network_id" {
  type        = string
  description = "Yandex Cloud vpc network id"
}

variable "k8s_subnet_id" {
  description = "Yandex Cloud vpc network subnet id"
}

#===== scale_policy

variable "scale_policy_size" {
  type        = number
  description = "Yandex Cloud instance group scale policy size"
}

#====== deploy_policy

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
