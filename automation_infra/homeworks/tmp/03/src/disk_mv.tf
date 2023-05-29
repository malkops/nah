resource "yandex_compute_disk" "disks" {
  count = 3
  name  = "disk-${count.index}"
  type  = "network-ssd"
  zone  = var.default_zone
  size  = 5
}

resource "yandex_compute_instance" "vm_with_disks" {
  name = "disks-example-vm"

  metadata = {
    ssh-keys = "ubuntu:${local.ssh-key}"
  }

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disks
    content {
      disk_id = yandex_compute_disk.disks[secondary_disk.key].id
    }
  }

  network_interface {
    subnet_id          = "e9bl8vli6ujjd4ej33bm"
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

}