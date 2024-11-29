terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Latest AWS provider
    }
  }
}

provider "aws" {
  region = var.aws_region
}

