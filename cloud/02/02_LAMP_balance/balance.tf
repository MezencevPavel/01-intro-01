## Создание Network Load Balancer (NLB)
resource "yandex_lb_network_load_balancer" "lamp-lb" {
  name = "lamp-lb"

  listener {
    name        = "my-listener"
    port        = 80
    target_port = 80
    protocol    = "tcp"
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.lamp-tg.id

    healthcheck {
      name = "tcp"
      tcp_options {
        port = 80
      }
    }
  }
}

resource "yandex_lb_target_group" "lamp-tg" {
  name      = "lamp-tg"

  dynamic "target" {
    for_each = yandex_compute_instance_group.lamp-group.instances.*.network_interface.0.ip_address
    content {
      subnet_id = yandex_vpc_subnet.lamp-subnet.id
      address  = target.value
    }
  }
}