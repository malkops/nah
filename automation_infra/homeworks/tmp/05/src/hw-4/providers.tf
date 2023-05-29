terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.91.0"
    }
    template = "~> 2.0"
  }
  required_version = ">=0.13"

  backend "s3" {
    bucket   = "netology-malkops-tfstate"
    key      = "tf.state"
    endpoint = "storage.yandexcloud.net"
    region   = "ru-central1"

    skip_region_validation      = true
    skip_credentials_validation = true

    encrypt           = true
    dynamodb_table    = "tfstate-lock"
    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g7e1btd6bq7ljelkvk/etnqkcqs56frvql2n1uh"
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}