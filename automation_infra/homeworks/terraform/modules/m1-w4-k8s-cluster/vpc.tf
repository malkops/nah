# commenting for pass a tests
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_compute_instance" "master" {
  name = "k8s-master"

  metadata = {
    user-data = "${file("~/nah/automation_infra/homeworks/terraform/modules/m1-w4-k8s-cluster/cloud-init.yaml")}"
  }

  resources {
    cores  = 4
    memory = 12
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 20
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

}

resource "yandex_compute_instance" "worker" {
  count = 1
  name = "k8s-worker-${count.index}"

  metadata = {
    user-data = "${file("~/nah/automation_infra/homeworks/terraform/modules/m1-w4-k8s-cluster/cloud-init.yaml")}"
  }

  resources {
    cores  = 4
    memory = 12
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 20
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

}

# provision master
resource "null_resource" "provsion_master" {
  count = var.provision == true ? 1 : 0
  connection {
    type  = "ssh"
    host  = yandex_compute_instance.master.network_interface.0.nat_ip_address
    user  = "user"
    agent = false
    private_key = file(var.connection_private_key)
  }

  provisioner "remote-exec" {
    script = "${path.module}/files/provision_master.sh"
  }
}

# provision worker
resource "null_resource" "provsion_worker" {
  # for_each = { for vm in yandex_compute_instance.worker: vm.network_interface.0.nat_ip_address => vm }
  count = var.provision == true ? 1 : 0

  connection {
    type  = "ssh"
    # host  = each.value.network_interface.0.nat_ip_address
    host  = yandex_compute_instance.worker.0.network_interface.0.nat_ip_address
    user  = "user"
    agent = false
    private_key = file(var.connection_private_key)
  }

  provisioner "remote-exec" {
    script = "${path.module}/files/provision_worker.sh"
  }
}
