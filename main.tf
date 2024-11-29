provider "aws" {
  region = "eu-west-2"
}

# Call the VPC Module
module "vpc" {
  source = "./vpc"  # Path to the VPC module

  name              = "london-vpc"
  cidr              = "10.0.0.0/16"
  azs               = ["eu-west-2a", "eu-west-2b"]
  private_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
