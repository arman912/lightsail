provider "aws" {
  region = "eu-west-2"
}

# Call the VPC Module
# module "vpc" {
#   source = "./vpc" # Path to the VPC module

#   name            = "london-vpc"
#   cidr            = "10.0.0.0/16"
#   azs             = ["eu-west-2a", "eu-west-2b"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
#   public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
# }

module "lightsail" {
  source               = "./lightsail"
  project_name         = var.project_name
  bundle_id            = var.bundle_id
  lightsail_blueprints = var.lightsail_blueprints
  domain_name          = var.domain_name
  subdomain            = var.subdomain
  route53_zone_id      = module.route53.zone_id # Pass the zone ID from Route53 module
  
}

module "route53" {
  source       = "./route53"
  domain_name  = var.domain_name
  subdomain    = var.subdomain
  lightsail_ip = module.lightsail.lightsail_static_ip
  
}
