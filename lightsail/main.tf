# Data block to get the VPC outputs from the VPC module
# data "terraform_remote_state" "vpc" {
#   backend = "local"  # This is for local state; adjust if you're using remote backend

#   config = {
#     path = "../vpc/terraform.tfstate"  # Adjust path if using different folder structure
#   }
# }
# Reference the local state of the VPC module


# Creating the Lightsail Instance with WordPress Blueprint
resource "aws_lightsail_instance" "wordpress_instance" {
  name              = var.project_name
  availability_zone = "eu-west-2a"                          # Use AZ from VPC outputs (e.g., eu-west-2a)
  blueprint_id      = var.lightsail_blueprints["wordpress"] # Blueprint for WordPress
  bundle_id         = var.bundle_id
  ip_address_type   = "ipv4" # Instance size (e.g., micro_2_0)
  #user_data         = file("./lightsail/lightsail.sh")
  connection {
    host        = aws_lightsail_static_ip.static_ip.ip_address # Static IP of Lightsail instance
    type        = "ssh"
    user        = "bitnami"                                                            # Default user for Lightsail Ubuntu instance
    private_key = file("/Users/amansingh/Downloads/LightsailDefaultKey-eu-west-2.pem") # Path to your SSH private key
  }
}


# Creating a Static IP for Lightsail instance
resource "aws_lightsail_static_ip" "static_ip" {
  name = "${var.project_name}_static_ip"
}

# Attaching the Static IP to the Lightsail instance
resource "aws_lightsail_static_ip_attachment" "static_ip_attach" {
  static_ip_name = aws_lightsail_static_ip.static_ip.id
  instance_name  = aws_lightsail_instance.wordpress_instance.name
}

# Route 53 A Record for Lightsail Instance
resource "aws_route53_record" "lightsail_record" {
  zone_id = var.route53_zone_id
  name    = var.domain_name # Or use "${var.subdomain}.${var.domain_name}" for subdomains
  type    = "A"
  ttl     = 300
  records = [aws_lightsail_static_ip.static_ip.ip_address]
}

# resource "aws_lightsail_domain" "domain_test" {
#   domain_name = "it-open.co.uk"
# }