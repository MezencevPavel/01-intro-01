resource "yandex_compute_instance" "private-vm" {
  name = "private-vm"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8e5oous6ulsjrcclqf"
      size     = 10
      type     = "network-hdd"
    }
  }

  platform_id = "standard-v2"

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}