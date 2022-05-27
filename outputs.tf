#
# Outputs
#

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "AWS VPC id."
  sensitive   = false # Setting an output value as sensitive prevents Terraform from showing its value in plan and apply.
}




