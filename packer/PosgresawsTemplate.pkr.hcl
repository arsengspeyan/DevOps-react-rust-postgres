variable "aws_access_key" {}
variable "aws_secret_key" {}
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
variable "postgres_user" {}
variable "postgres_password" {}
variable "postgres_db" {}

build {
  type          = "amazon-ebs"
  region        = var.region
  source_ami    = var.source_ami
  instance_type = var.instance_type
  ssh_username  = var.ssh_username
  ami_name      = "packer-postgresql-{{timestamp}}"
}

provisioner "ansible" {
  playbook_file = "../ansible/setup_postgresql.yml"
  extra_arguments = [
    "--extra-vars", "postgres_user=${var.postgres_user} postgres_password=${var.postgres_password} postgres_db=${var.postgres_db}"
  ]
}
