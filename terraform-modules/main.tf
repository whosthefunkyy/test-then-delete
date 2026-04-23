
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket         = "devops-popa-2026"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}


provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}
module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
  instance_type = "t2.micro"
  key_name = "devops-key"
  project_name = "devops-proj"
}
resource "aws_eip" "static_ip" {
  domain = "vpc"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2.instance_id
  allocation_id = aws_eip.static_ip.id
}