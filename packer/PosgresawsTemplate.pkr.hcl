packer {
  required_plugins {
    amazon {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# Retrieve AWS credentials from GitHub Secrets
variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "region" {
  default = "us-east-1"
}
variable "source_ami" {
  default = "ami-0a0e5d9c7acc336f1"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "ssh_username" {
  default = "ubuntu"
}

variable "postgres_user" {
  default = ""
}

variable "postgres_password" {
  default = ""
}

variable "postgres_db" {
  default = ""
}

# Define the build block for creating the AMI
build {
  sources = [
    "amazon-ebs.source_ami"
  ]

  communicator = "ssh"
  ssh_username = var.ssh_username
  ami_name     = "packer-postgresql-{{timestamp}}"

  # Define provisioners within the build block
  provisioner "ansible" {
    playbook_file = "../ansible/setup_postgresql.yml"
    extra_arguments = [
      "--extra-vars", "postgres_user=${var.postgres_user} postgres_password=${var.postgres_password} postgres_db=${var.postgres_db}"
    ]
  }
}
