resource "yandex_kms_symmetric_key" "key-a" {
  name              = "example-symmetric-key"
  description       = "description for key"
  default_algorithm = "AES_256"
  rotation_period   = "8760h" // equal to 1 year
}

// Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = var.service_account_id
  description        = "static access key for object storage"
}

// Шифрование бакета
resource "yandex_storage_bucket" "test" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "image"
  acl        = "public-read"
  max_size   = 1073741824

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}


// Шифрование объекта в бакете
resource "yandex_storage_object" "netology_image_encrypted" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = yandex_storage_bucket.test.bucket
  key        = "image.jpeg"
  source     = "./image.jpeg"
  acl           = "public-read"
  content_type  = "image/jpeg"
}