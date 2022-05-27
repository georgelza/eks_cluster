

# Inbound rule - Add to all hosts to allow access from jumpserver
resource "aws_security_group" "sg_management_ssh" {
  name_prefix = "sg_management_ssh"

  # The VPC ID to create in.
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.7.51.0/24",
      "10.7.52.0/24",
    ]
  }

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "sg_management_ssh"
    }
  )

}

# Outbound Rule - Add to jump server to allow egress
resource "aws_security_group" "sg_jumpserver_access" {
  name_prefix = "sg_jumpserver_access_"

  # The VPC ID to create in.
  vpc_id = aws_vpc.main.id

  ## ssh egress from server to clients
  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Outbound SSH access to clients"

    cidr_blocks = [
      "10.7.0.0/16",
    ]
  }

  ## ssh ingress from internet
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = "SSH access from Internet"
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }

  ]

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "sg_jumpserver_access"
    }
  )

}

# Outbound Rule - Web access to do package installs/updates
resource "aws_security_group" "sg_web" {

  name_prefix = "sg_web_"

  # The VPC ID to create in.
  vpc_id = aws_vpc.main.id

  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = "Internet access via Port 80 to access to pull/install packages"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    },
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = "Internet access via Port 443 to access to pull/install packages"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    },
  ]

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "sg_web"
    }
  )
}