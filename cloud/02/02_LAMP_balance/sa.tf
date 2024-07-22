# создание сервисного аккаунта SA
resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = "sa"
}

# Назначение роли "storage.admin" сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-storage-admin" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

# Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}


resource "yandex_resourcemanager_folder_iam_member" "sa-network-user" {
  folder_id = var.folder_id
  role      = "network.user"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}