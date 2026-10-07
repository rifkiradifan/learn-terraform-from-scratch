# The VPC itself — an isolated private network in AWS
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support   = true # VPC can resolve DNS via the AmazonProvidedDNS (.2 address)
  enable_dns_hostnames = true # instances get public DNS names — required later for VPC Interface Endpoints

  tags = {
    Name = "learn-tf-dev-vpc" # "Name" is the tag the AWS console shows as the resource name
  }
}
