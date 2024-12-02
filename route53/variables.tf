variable "domain_name" {
  description = "The domain name for Route 53 setup (e.g., example.com)"
  type        = string
}

variable "subdomain" {
  description = "The subdomain to point to Lightsail (e.g., www)"
  type        = string
  default     = "www"
}

variable "lightsail_ip" {
  description = "The static public IP of the Lightsail instance"
  type        = string
}

