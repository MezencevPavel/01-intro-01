
###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "var.vms_ssh_root_key"
  description = "ssh-keygen -t ed25519"
}

###DZ 4.2

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}
variable "vpc_name1" {
  type        = string
  default     = "develop1"
  description = "VPC network & subnet name"
}

variable "vm_web_resources" {
  type = map(any)
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  description = "VM web"
}
variable "vm_web1_resources" {
  type = map(any)
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  description = "VB web1 db"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family"
}

variable "vm_web_name" {
  type        = string
  default     = "web"
  description = "name"
}
variable "vm_web_name1" {
  type        = string
  default     = "web1"
  description = "name"
}
variable "vm_name_prefix" {
  type    = string
  default = "netology-develop-platform"
}
variable "vm_name_prefix1" {
  type    = string
  default = "netology-develop-platform"
}


variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
}

variable "vm_web_scheduling_policy" {
  type        = bool
  default     = "true"
  description = "cheduling_policy"
}

variable "vm_web_network_interface" {
  type        = bool
  default     = "true"
  description = "network_interface"
}





###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
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

