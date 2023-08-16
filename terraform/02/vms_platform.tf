resource "yandex_vpc_network" "develop1" {
  name = var.vpc_name1
}
resource "yandex_vpc_subnet" "develop1" {
  name           = var.vpc_name1
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop1.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu1" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform1" {
  name        = local.vm_web_name1
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web1_resources.cores
    memory        = var.vm_web1_resources.memory
    core_fraction = var.vm_web1_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu1.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_scheduling_policy
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop1.id
    nat       = var.vm_web_network_interface
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
