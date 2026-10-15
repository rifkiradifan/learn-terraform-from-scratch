# Configure the AWS provider declared in versions.tf
provider "aws" {
  region = var.aws_region

  # Tags applied automatically to EVERY resource this provider creates
  default_tags {
    tags = {
      Project     = "learn-terraform-from-scratch"
      Environment = var.environment
      ManagedBy   = "terraform" # tells humans: don't edit this in the console
    }
  }
}
