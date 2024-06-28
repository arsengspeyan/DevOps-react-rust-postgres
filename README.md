# DevOps Project README

Welcome to the DevOps project README. This document provides an overview of the project and detailed instructions for setting up and deploying the infrastructure and applications.

## Project Overview
This project aims to deploy a scalable web application infrastructure on AWS using Terraform, Packer, Ansible, GitHub Actions, CloudFront, and Amazon EKS. Below are the main tasks and their respective setups:

## Tasks
### 1. Database Creation with Packer + Ansible and Deployment on EC2
Description: Create a database using Packer and Ansible and deploy it on EC2 instances.

#### 2. Remote Backend on S3 Bucket
Description: Configure Terraform to use S3 as a remote backend for state storage.

#### 3. Infrastructure Creation with Terraform on AWS
Description: Use Terraform to provision infrastructure on AWS.

#### 4. Building React Files with GitHub Actions and Uploading to S3 Bucket
Description: Automate the build process of React files using GitHub Actions and deploy to an S3 bucket.

#### 5. Frontend Serving with CloudFront, SSL Setup, and HTTPS Redirections
Description: Serve the frontend application using CloudFront with SSL setup and HTTPS redirections.

#### 6. Backend Deployment on EKS with Minimum 3 Replicas
Description: Deploy the backend application on Amazon EKS with a minimum of 3 replicas for scalability and high availability.

## Setup Instructions

### Prerequisites
Ensure you have the following installed and configured:

AWS CLI
Terraform
Packer
Ansible
GitHub Actions setup with appropriate secrets and workflows

## Steps

#### 1.Database Creation with Packer + Ansible and Deployment on EC2

Navigate to the Packer directory: cd packer/

Modify packer.json to define the EC2 instance and Ansible provisioning.
Build the AMI: packer build packer.json
Deploy the EC2 instance using the generated AMI.

#### 2.Remote Backend on S3 Bucket

Create an S3 bucket manually.
Update backend.tf to configure Terraform to use the S3 bucket as the backend.


#### 3.Infrastructure Creation with Terraform on AWS

Clone this repository: git clone <repository_url>
Navigate to the Terraform directory: cd terraform/
Initialize Terraform: terraform init
Review the execution plan: terraform plan
Apply the changes: terraform apply


#### 4.Building React Files with GitHub Actions and Uploading to S3 Bucket

Configure GitHub Actions workflows in .github/workflows/ to build React files on push or pull request events.
Ensure the workflow uploads the built files to the designated S3 bucket.

#### 5.Frontend Serving with CloudFront, SSL Setup, and HTTPS Redirections

Create a CloudFront distribution with the S3 bucket as the origin.
Obtain or import an SSL certificate from AWS ACM.
Configure CloudFront to use HTTPS and set up HTTP to HTTPS redirections.

#### 6.Backend Deployment on EKS with Minimum 3 Replicas

Define Kubernetes manifests (deployment.yaml, service.yaml) for the backend application.
Deploy the application on Amazon EKS: kubectl apply -f <manifests>

## Usage
Provide instructions on accessing and using the deployed application and infrastructure.

Contributing
If you wish to contribute to this project, please fork the repository and submit pull requests.

Troubleshooting
Include troubleshooting tips and solutions for common issues.

License
This project is licensed under the [License Name] - see the LICENSE file for details.
