terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-west-2"
  access_key = "****"
  secret_key = "****"
}

# Create EC2 instance on us-west-2
resource "aws_instance" "tfdemoinstance1" {
  ami           = "ami-0ceecbb0f30a902a6"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Demo Instance 1"
  }
}

# Create EC2 instance on us-west-2
resource "aws_instance" "tfdemoinstance2" {
  ami           = "ami-0ceecbb0f30a902a6"
  instance_type = "t1.micro"

  tags = {
    Name = "Terraform Demo Instance 2"
  }
}


output "instance_ip_addr1" {
  value       = aws_instance.tfdemoinstance1.private_ip
  description = "The private IP address of the main server instance."
}

output "instance_ip_addr2" {
  value       = aws_instance.tfdemoinstance2.private_ip
  description = "The private IP address of the main server instance."
}

