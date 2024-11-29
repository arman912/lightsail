terraform {
  required_version = ">= 1.5.0"  # Ensure you're using at least Terraform version 1.5.0

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Latest AWS provider version
    }
  }
}

# AWS provider configuration for the London region (eu-west-2)
provider "aws" {
  region = var.aws_region  # Region defined in variables.tf
}

# Create the VPC resource
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"  # Define CIDR block
  enable_dns_support   = true            # Enable DNS support
  enable_dns_hostnames = true            # Enable DNS hostnames
  tags = {
    Name = "London-VPC"                  # Tag the VPC for identification
  }
}

# Output the VPC ID for reference
output "vpc_id" {
  value = aws_vpc.main.id
}
