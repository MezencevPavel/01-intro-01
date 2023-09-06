
locals {
  ssh_public_key = {

    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}
