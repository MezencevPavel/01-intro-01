module "vpc" {
  source       = "./vpc"
  subnet_zones = "ru-central1-b"
  subnet_name  = "develop-ru-central1-b"
  v4_cidr_blocks = [{ zone = "ru-central1-a", cidr = ["10.0.1.0/24"] }, { zone = "ru-central1-b", cidr = ["10.0.2.0/24"] },
  { zone = "ru-central1-c", cidr = ["10.0.3.0/24"] }]
  vpc_name = "develop"
}

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = module.vpc.network_id
  subnet_zones   = module.vpc.subnet_zones
  subnet_ids     = module.vpc.subnet_id
  instance_name  = "vm"
  instance_count = 1
  image_family   = var.image_family
  public_ip      = true

  metadata = {
    serial-port-enable = 1
  }

}

