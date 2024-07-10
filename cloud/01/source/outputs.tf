output "public_vm_external_ip" {
  description = "External IP address of the public VM"
  value       = yandex_compute_instance.public-vm.network_interface.0.nat_ip_address
}

output "public_vm_internal_ip" {
  description = "Internal IP address of the public VM"
  value       = yandex_compute_instance.public-vm.network_interface.0.ip_address
}

output "private_vm_internal_ip" {
  description = "Internal IP address of the private VM"
  value       = yandex_compute_instance.private-vm.network_interface.0.ip_address
}

output "nat_instance_internal_ip" {
  description = "Internal IP address of the NAT instance"
  value       = yandex_compute_instance.nat.network_interface.0.ip_address
}