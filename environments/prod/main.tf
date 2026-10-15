# Panggil module VPC — source = path relatif ke folder module
module "vpc" {
  source = "../../modules/vpc"

  # Input module = argumen fungsi. Nama kiri harus sama dengan variable di module
  environment = var.environment
  vpc_cidr    = var.vpc_cidr
}

