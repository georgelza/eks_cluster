# Resource: aws_route_table_association
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

# Public subnet for App ingress
resource "aws_route_table_association" "public1" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public_1.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public_2.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public3" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public_3.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public.id
}

# Public subnet for Jumpserver ingress
resource "aws_route_table_association" "public4" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public_4.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public5" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public_5.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public.id
}


# Private Subnets - App
resource "aws_route_table_association" "private1" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_1.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private2" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_2.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private2.id
}

resource "aws_route_table_association" "private3" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_3.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private3.id
}

resource "aws_route_table_association" "private4" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_4.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private5" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_5.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private2.id
}

resource "aws_route_table_association" "private6" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_6.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private3.id
}


# Private Subnets - DB
resource "aws_route_table_association" "private7" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_7.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private8" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_8.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private2.id
}

resource "aws_route_table_association" "private9" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_9.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private3.id
}

resource "aws_route_table_association" "private10" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_10.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private11" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_11.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private2.id
}

resource "aws_route_table_association" "private12" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_12.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private3.id
}


# Private Subnets - Management
resource "aws_route_table_association" "private13" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_13.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private14" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_14.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private2.id
}

resource "aws_route_table_association" "private15" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_15.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private3.id
}

resource "aws_route_table_association" "private16" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_16.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private17" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_17.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private2.id
}

resource "aws_route_table_association" "private18" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_18.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private3.id
}