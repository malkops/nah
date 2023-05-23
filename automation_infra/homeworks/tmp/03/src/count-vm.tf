data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "count" {
  count = 2
  name  = "count-example-vm-${count.index}"

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

  network_interface {
    subnet_id = "e9bl8vli6ujjd4ej33bm"
    nat       = true
  }

}