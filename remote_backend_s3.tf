terraform {
  backend "s3" {
    bucket = "devops-proj-1-remote-state-bucket-11"
    key    = "devops-project-1/dev_project/terraform.tfstate"
    region = "us-west-1"
  }
}