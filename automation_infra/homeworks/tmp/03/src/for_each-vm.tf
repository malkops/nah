locals {
  ssh-key = file("~/.ssh/netology.pub")
}

variable "for_each_data" {
  type = list(object({ vm_name = string, cpu = number, ram = number, disk = number }))
  default = [{ vm_name = "for-each-1", cpu = 2, ram = 2, disk = 10 },
  { vm_name = "for-each-2", cpu = 4, ram = 4, disk = 12 }]
}

resource "yandex_compute_instance" "for_each" {
  for_each = { for vm in var.for_each_data : vm.vm_name => vm }

  depends_on = [yandex_compute_instance.count]

  name = "count-example-vm-${each.value.vm_name}"

  metadata = {
    ssh-keys = "ubuntu:${local.ssh-key}"
  }

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = 20
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk
    }
  }

  network_interface {
    subnet_id = "e9bl8vli6ujjd4ej33bm"
    nat       = true
  }

}