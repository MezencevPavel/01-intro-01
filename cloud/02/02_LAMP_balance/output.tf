output "instance_public_ips" {
  value = {
    for instance in yandex_compute_instance_group.lamp-group.instances :
    instance.name => instance.network_interface.0.nat_ip_address
  }
  description = "Public IP addresses of instances in the group"
}
