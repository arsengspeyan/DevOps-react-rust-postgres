output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.dev-proj-us-west-vpc-1.id
}

output "private_subnet_1_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private_subnet_1.id
}



output "private_subnet_2_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private_subnet_2
}