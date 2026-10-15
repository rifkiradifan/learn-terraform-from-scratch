# Settings for Terraform itself — not for AWS
terraform {
  # Terraform CLI version allowed to run this code
  required_version = "~> 1.16.0"

  # Providers this code needs, and where to download them from
  required_providers {
    aws = {
      source  = "hashicorp/aws" # registry.terraform.io/hashicorp/aws
      version = "~> 6.0"        # 6.x allowed, 7.0 not
    }
  }
}
