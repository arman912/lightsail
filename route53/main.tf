resource "aws_route53_zone" "main" {
  name = var.domain_name
}
resource "aws_route53_record" "subdomain" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.subdomain
  type    = "A"
  ttl     = 300
  records = [var.lightsail_ip] # The static IP of the Lightsail instance
}
