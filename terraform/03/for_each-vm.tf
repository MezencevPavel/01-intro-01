data "yandex_compute_image" "vms" {
  family = var.vm_web_family
}

resource "yandex_compute_instance" "vms" {
  depends_on = [resource.yandex_compute_instance.web]
  for_each = {
    for index, vm in var.vms :
    vm.name => vm
  }

  platform_id = "standard-v1"
  name        = each.value.name

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.vms.image_id
      size     = each.value.size
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true

  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}
