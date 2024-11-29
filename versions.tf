terraform {
  required_version = ">= 1.5.0" # Adjust to the latest stable version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Latest major version for AWS provider
    }
  }
}
