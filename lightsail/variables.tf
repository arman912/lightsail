# Project name
variable "project_name" {
  description = "The name of the Lightsail project"
  type        = string
}

# Lightsail Blueprint (WordPress)
variable "lightsail_blueprints" {
  description = "A map of Lightsail blueprint IDs"
  type        = map(string)
  default = {
    wordpress = "wordpress"
  }
}

# Bundle ID for Lightsail instance
variable "bundle_id" {
  description = "The Lightsail bundle size"
  type        = string
  default     = "micro_2_0" # Default Lightsail instance size
}

variable "domain_name" {
  description = "The domain name for DNS setup (e.g., example.com)"
  type        = string
}

# Subdomain for DNS
variable "subdomain" {
  description = "Subdomain to point to Lightsail (e.g., www)"
  type        = string
  default     = "www"
}
variable "route53_zone_id" {
  description = "The ID of the Route 53 hosted zone"
  type        = string
}