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
