variable "cloud_id" {
  description = "Идентификатор облака Yandex"
}

variable "folder_id" {
  description = "Идентификатор папки Yandex"
}

variable "zone" {
  description = "Зона Yandex Cloud"
  default     = "ru-central1-a"
}


variable "yandex_token" {
  type        = string
  description = "OAuth или статический ключ"
}