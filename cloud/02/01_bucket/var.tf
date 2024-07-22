variable "yandex_token" {
  type        = string
  description = "OAuth или статический ключ"
}

variable "cloud_id" {
  type        = string
  description = "ID облака"
}

variable "folder_id" {
  type        = string
  description = "ID папки"
}

variable "zone" {
  type        = string
  description = "Зона доступности"
}