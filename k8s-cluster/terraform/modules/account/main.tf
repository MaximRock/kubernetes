# Service account

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
}

# Создаем сервис аккаунт SA
resource "yandex_iam_service_account" "sa" {
  name        = "test"
  description = "Yandex cloud service account"
  folder_id   = var.yc_folder_id
}

# Даем права на запись для этого SA
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.yc_folder_id
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
  role      = "editor"
}

# Создаем ключи доступа Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}
