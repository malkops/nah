resource "yandex_compute_instance" "nat" {
  name = "nat"

  metadata = {
    user-data = "${file("~/nah/cloud/terraform/files/cloud-init.yaml")}"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
      size = 20
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    nat        = true
    ip_address = "192.168.10.254"
  }

}

resource "yandex_compute_instance" "public" {
  name = "public"

  metadata = {
    user-data = "${file("~/nah/cloud/terraform/files/cloud-init.yaml")}"
  }

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = "fd83s8u085j3mq231ago"
      size = 20
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    nat        = true
  }

}

resource "yandex_compute_instance" "private" {
  name = "private"

  metadata = {
    user-data = "${file("~/nah/cloud/terraform/files/cloud-init.yaml")}"
  }

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = "fd83s8u085j3mq231ago"
      size = 20
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.private.id
    nat        = false
  }

}