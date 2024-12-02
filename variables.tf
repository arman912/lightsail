# Root level variables.tf

# AWS Region
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2" # Default to London region
}

# Project name
variable "project_name" {
  description = "The name of the project (used to name resources)"
  type        = string
}

# VPC CIDR block
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Availability Zones
variable "azs" {
  description = "The list of Availability Zones to use for subnets"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}

# Private Subnets
variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

# Public Subnets
variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

# Declare the variable for Lightsail bundle size
variable "bundle_id" {
  description = "The Lightsail bundle size"
  type        = string
}

# Declare the variable for the domain name
variable "domain_name" {
  description = "The domain name for DNS setup (e.g., example.com)"
  type        = string
}
# Declare the variable for the subdomain
variable "subdomain" {
  description = "The subdomain to create (e.g., www)"
  type        = string
  default     = "www" # You can specify a default value or leave it empty if it's required
}

# Lightsail Blueprint (WordPress)
variable "lightsail_blueprints" {
  description = "A map of Lightsail blueprint IDs"
  type        = map(string)
  default = {
    wordpress = "wordpress"
  }
}





