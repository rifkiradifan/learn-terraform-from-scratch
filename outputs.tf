output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id # <TYPE>.<LOCAL_NAME>.<ATTRIBUTE>
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}
