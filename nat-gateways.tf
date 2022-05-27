
# Resource: aws_nat_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "gw1" {
  # The Allocation ID of the Elastic IP address for the gateway.
  allocation_id = aws_eip.nat1.id

  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.public_1.id


  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "natgw-az1-${var.cluster_name}"
    }
  )

}

resource "aws_nat_gateway" "gw2" {
  # The Allocation ID of the Elastic IP address for the gateway.
  allocation_id = aws_eip.nat2.id

  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.public_2.id

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "natgw-az2-${var.cluster_name}"
    }
  )

}

resource "aws_nat_gateway" "gw3" {
  # The Allocation ID of the Elastic IP address for the gateway.
  allocation_id = aws_eip.nat3.id

  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.public_3.id

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "natgw-az3-${var.cluster_name}"
    }
  )

}