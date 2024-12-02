output "lightsail_instance_name" {
  value = aws_lightsail_instance.wordpress_instance.name
}

output "lightsail_static_ip" {
  value = aws_lightsail_static_ip.static_ip.ip_address
}

output "lightsail_route53_record" {
  value = aws_route53_record.lightsail_record.fqdn
}