packer {
  required_plugins {
    amazon = {
      version = ">= 1.3.1"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }

  }
}

source "amazon-ebs" "example" {
  region         = var.region
  source_ami     = var.source_ami
  instance_type  = var.instance_type
  ssh_username   = var.ssh_username
  ami_name       = "packer-postgresql"
  access_key     = var.aws_access_key       
  secret_key     = var.aws_secret_key   
}

build {
  sources = ["source.amazon-ebs.example"]

provisioner "ansible" {
  playbook_file = "/ansible/setup_postgresql.yml"
  }
}

variable "region" {
  type    = string
  default = "us-west-1"
}

variable "source_ami" {
  type    = string
  default = "ami-0ecaad63ed3668fca"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

variable "aws_access_key" {
  type = string
  sensitive = true
  default = ""
}

variable "aws_secret_key" {
  type = string
  sensitive = true
  default = ""
}
