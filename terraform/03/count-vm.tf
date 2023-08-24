data "yandex_compute_image" "web" {
  family = var.vm_web_family
}

resource "yandex_compute_instance" "web" {
  count       = 2
  name        = "netology-develop-platform-dev-${count.index + 1}"
  platform_id = var.vm_web_platform_id
  resources {
    cores         = 2
    memory        = 4
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.vms.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  scheduling_policy {
    preemptible = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}
