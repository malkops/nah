variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "connection_private_key" {
  description = "Path to the private key used for provisioning"
}

variable "image_id" {
  description = "Image id"
  default = "fd88m3uah9t47loeseir"
}

variable subnet_id {
  description = "Subnets for modules"
}

variable "provision" {
  description = "Is necessary provisioning"
  default = "false"
}
