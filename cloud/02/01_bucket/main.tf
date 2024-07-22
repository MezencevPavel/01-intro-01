# создание сервисного аккаунта SA
resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = "tf-s3-sa"
}

#  Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

# Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}

#  Создание бакета с использованием ключа
resource "yandex_storage_bucket" "test" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "pavel2"
  max_size   = 1073741824

  versioning {
    enabled = true
  }
}
# Запись объекта в бакет
resource "yandex_storage_object" "netology_image" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = yandex_storage_bucket.test.bucket
  key        = "image.jpeg"
  source     = "./image.jpeg"
  acl        = "public-read"
  content_type = "imadge/jpeg"
}