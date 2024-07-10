resource "yandex_vpc_network" "network" {
  name = "yc-network"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = "ru-central1-a"
}