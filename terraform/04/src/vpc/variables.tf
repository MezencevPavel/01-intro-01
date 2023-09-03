###cloud vars
variable "token" {
  type        = string
  default     = "y0_AgAAAAABLbClAATuwQAAAADn3e8d0GrS61A_T6-28_5MUiu26-FVkdE"
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1g6ms8dq7ksv1c90h72"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  default     = "b1gs1llod3ucp43k3e79"
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###common vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP9zRgf+U++o3teOeyp8IkVuN8RwiHdOstq5r9gqSVnm"
  description = "ssh-keygen -t ed25519"
}

###example vm_web var
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "example vm_web_ prefix"
}

###example vm_db var
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "example vm_db_ prefix"
}


variable "subnets" {
  description = "vpc_subnets description"
  type = map(object({
    zone = string
    cidr = string
  }))
}

variable "labels" {
  type        = map(string)
  description = "Labels to mark resources."
  default     = {}
}



