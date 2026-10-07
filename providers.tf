# Configure the AWS provider declared in versions.tf
provider "aws" {
  region = "ap-southeast-1" # hardcoded for now — becomes a variable in step 4

  # Tags applied automatically to EVERY resource this provider creates
  default_tags {
    tags = {
      Project     = "learn-terraform-from-scratch"
      Environment = "dev"
      ManagedBy   = "terraform" # tells humans: don't edit this in the console
    }
  }
}
