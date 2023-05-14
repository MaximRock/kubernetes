# variable account

variable "yc_token" {
  type        = string
  description = "Yandex Cloud PI key"
  default     = ""
}

variable "yc_cloud_id" {
  type        = string
  description = "Yandex Cloud id"
  default     = ""
}

variable "yc_folder_id" {
  type        = string
  description = "Yndex Cloud folder id"
  default     = ""
}
