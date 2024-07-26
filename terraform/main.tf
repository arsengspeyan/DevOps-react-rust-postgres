# vpc module 

module "networking" {
  source               = "./networking"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  us_availability_zone_1 = var.us_availability_zone_1
  us_availability_zone_2 = var.us_availability_zone_2  
  cidr_private_subnet_1  = var.cidr_private_subnet_1
  cidr_private_subnet_2  = var.cidr_private_subnet_2
}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "private_subnet_1" {
  value = module.networking.private_subnet_1_ids
}


output "private_subnet_2" {
  value = module.networking.private_subnet_2_ids
}


# ec2_instance module 

module "ec2_instance" {
  source             = "./ec2_instance"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.networking.private_subnet_1_ids
  instance_name      = var.instance_name
}



output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}


output "ec2_instance_private_ip" {
  value = module.ec2_instance.private_ip
}



module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = var.cluster_name
  cluster_version = "1.21"

  vpc_id   = module.networking.vpc_id
  subnet_ids  = [
    module.networking.private_subnet_1_ids,
    module.networking.private_subnet_2_ids
  ]
  control_plane_subnet_ids = module.networking.private_subnet_2_ids


eks_managed_node_groups = {
  example = {
    
    instance_types = ["t2.micro"]

    min_size     = 1
    max_size     = 3
    desired_size = 2
  }
}

  
  tags = {
    Environment = "Production"
    # Add more tags as needed
  }
}


