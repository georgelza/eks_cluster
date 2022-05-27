# Resource: aws_route_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "public" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC internet gateway or a virtual private gateway.
    gateway_id = aws_internet_gateway.main.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name    = "public_route_table-${var.cluster_name}"
    team    = var.team
    project = var.project
  }
}

resource "aws_route_table" "private1" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC NAT gateway.
    nat_gateway_id = aws_nat_gateway.gw1.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name    = "private_route_table_az1-${var.cluster_name}"
    team    = var.team
    project = var.project
  }
}

resource "aws_route_table" "private2" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC NAT gateway.
    nat_gateway_id = aws_nat_gateway.gw2.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name    = "private_route_table_az2-${var.cluster_name}"
    team    = var.team
    project = var.project
  }
}


resource "aws_route_table" "private3" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC NAT gateway.
    nat_gateway_id = aws_nat_gateway.gw3.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name    = "private_route_table_az3-${var.cluster_name}"
    team    = var.team
    project = var.project
  }
}