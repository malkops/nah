terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "m1-w4-k8s-cluster" {
  source                 = "./modules/m1-w4-k8s-cluster"
  public_key_path        = var.public_key_path
  subnet_id              = var.subnet_id
  connection_private_key = var.connection_private_key
  provision              = true
}
