output "vpc_id" {
  value = aws_vpc.vpc.id # Referencing the VPC resource created in main.tf
}

output "public_subnets" {
  value = aws_subnet.public_subnet[*].id # Referencing the public subnets
}

output "private_subnets" {
  value = aws_subnet.private_subnet[*].id # Referencing the private subnets
}


output "azs" {
  value = var.azs # Outputs the AZs that were passed in as variables
}
