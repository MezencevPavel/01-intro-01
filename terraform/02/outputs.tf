output "external_ip_address_web" {
  value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
}

output "external_ip_address_web1" {
  value = yandex_compute_instance.platform1.network_interface.0.nat_ip_address
}
