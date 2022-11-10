terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "eu-north-1"
}
resource "aws_vpc" "EliVPC" {
  cidr_block = "192.168.0.0/16"
  tags = {
    "Name" = "Eli-dev-vpc"
  }
}
resource "aws_subnet" "Subnet_Web" {
  vpc_id     = aws_vpc.EliVPC.id
  cidr_block = "192.168.0.0/20"
  tags = {
    "Name" = "Eli-k8s-subnet"
  }
}
