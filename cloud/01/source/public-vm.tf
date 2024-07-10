resource "yandex_compute_instance" "public-vm" {
  name = "public-vm"

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
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}