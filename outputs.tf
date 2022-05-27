#
# Outputs
#


output "ec2_jumpserver_publi_ips" {
  value       = aws_instance.jumpserver.*.public_ip
  description = "ec2_jumpserver_publi_ips "
  sensitive   = false
}

output "ec2_prometheus_private_ips" {
  value       = aws_instance.prometheus.*.private_ip
  description = "ec2_prometheus_private_ips "
  sensitive   = false
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "AWS VPC id."
  sensitive   = false # Setting an output value as sensitive prevents Terraform from showing its value in plan and apply.
}




