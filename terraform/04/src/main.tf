module "vpc" {
  source = "./vpc"

  subnets = {
    public-ru-central1-a = {
      zone = "ru-central1-a",
      cidr = "10.0.1.0/24"
    },
  }

  labels = {
    owner       = "pavel"
    project     = "vpc_test"
    environment = "test"
  }
}
