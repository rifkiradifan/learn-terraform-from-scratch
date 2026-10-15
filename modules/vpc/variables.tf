variable "environment" {
  description = "Environment name, used in tags and resource names"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
