output "external_ip_address_worker" {
  value = [
    for vm in yandex_compute_instance.worker :
    "VM name ${vm.name} has external address: ${vm.network_interface.0.nat_ip_address}"
  ]
}

output "internal_ip_address_worker" {
  value = [
    for vm in yandex_compute_instance.worker :
    "VM name ${vm.name} has internal address: ${vm.network_interface[0].*.ip_address[0]}"
  ]
}

output "external_ip_address_master" {
  value = "master has external address: ${yandex_compute_instance.master.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_master" {
  value = "master has internal address: ${yandex_compute_instance.master.network_interface[0].*.ip_address[0]}"
}
