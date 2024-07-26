resource "aws_vpc" "dev-proj-us-west-vpc-1" {
  cidr_block = var.vpc_cidr  // Replace with your desired CIDR block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

// Subnet 1 in Availability Zone b
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.dev-proj-us-west-vpc-1.id
  cidr_block        = var.cidr_private_subnet_1  // Replace with your desired CIDR block
  availability_zone = var.us_availability_zone_1  // Replace with your desired AZ

  tags = {
    Name = "dev-proj-private-subnet-1"
  }
}


// Subnet 2 in Availability Zone c
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.dev-proj-us-west-vpc-1.id
  cidr_block        = var.cidr_private_subnet_2  // Replace with your desired CIDR block
  availability_zone = var.us_availability_zone_2  // Replace with your desired AZ

  tags = {
    Name = "dev-proj-private-subnet-2"
  }
}
