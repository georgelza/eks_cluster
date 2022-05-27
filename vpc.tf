# Resource: aws_vpc
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

#---------------------------------------------------------------
# Supporting Resources for EKS Environment
#---------------------------------------------------------------
resource "aws_vpc" "main" {

  cidr_block            = var.vpc_cidr # The CIDR block for the VPC.
  instance_tenancy      = "default"    # Makes your instances shared on the host.

  enable_dns_support    = true # Required for EKS. Enable/disable DNS support in the VPC.
  enable_dns_hostnames  = true # Required for EKS. Enable/disable DNS hostnames in the VPC.

  enable_classiclink               = false # Enable/disable ClassicLink for the VPC.
  enable_classiclink_dns_support   = false # Enable/disable ClassicLink DNS Support for the VPC.
  assign_generated_ipv6_cidr_block = false # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC.


  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = var.vpc_name
    }
  )

}

