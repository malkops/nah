resource "yandex_vpc_network" "netology" {
  name = "netology"
}

resource "yandex_vpc_subnet" "public" {
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.netology.id}"
  v4_cidr_blocks = [ "192.168.10.0/24" ]
}

resource "yandex_vpc_subnet" "private" {
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.netology.id}"
  v4_cidr_blocks = [ "192.168.20.0/24" ]
  route_table_id = "${yandex_vpc_route_table.rt-a.id}"
}

resource "yandex_vpc_route_table" "rt-a" {
  network_id = "${yandex_vpc_network.netology.id}"

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}
