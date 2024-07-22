## Создание инстансов
resource "yandex_compute_instance_group" "lamp-group" {
  name               = "lamp-group"
  folder_id          = var.folder_id
  service_account_id = yandex_iam_service_account.sa.id


  allocation_policy {
    zones = ["ru-central1-a"]
  }

  instance_template {
    platform_id = "standard-v2"

    resources {
      cores  = 2
      memory = 2
      core_fraction = 5
    }

    boot_disk {
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
        type = "network-hdd"
        size = 10
      }
    }

    network_interface {
      nat       = true
      subnet_ids = [yandex_vpc_subnet.lamp-subnet.id]
    }

    metadata = {
      user-data = file("user.txt")
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion = 1
  }

  health_check {
    tcp_options {
      port = 80
    }
    interval = 10
    timeout = 5
    unhealthy_threshold = 5
    healthy_threshold = 5
  }
}