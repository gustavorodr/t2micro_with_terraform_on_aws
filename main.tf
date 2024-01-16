provider "aws" {
  region = var.region
}

module "my_instance" {
  source = "./modules/instance"
  ssh_cidr = var.ssh_cidr
}

output "instance_public_ip" {
  value = module.my_instance.public_ip
}
