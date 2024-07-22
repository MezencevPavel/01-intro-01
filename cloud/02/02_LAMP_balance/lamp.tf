resource "yandex_vpc_network" "lamp-network" {
  name = "lamp-network"
}

resource "yandex_vpc_subnet" "lamp-subnet" {
  name           = "lamp-subnet"
  network_id     = yandex_vpc_network.lamp-network.id
  v4_cidr_blocks = ["10.0.1.0/24"]
  zone           = "ru-central1-a"
}