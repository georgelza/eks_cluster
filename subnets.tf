# Resource: aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public_1" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.11.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1a"

  # Required for EKS. Instances launched into the subnet should be assigned a public IP address.
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn_pub-af-south-1a"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }
}

resource "aws_subnet" "public_2" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.12.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1b"

  # Required for EKS. Instances launched into the subnet should be assigned a public IP address.
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn_pub-af-south-1b"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }
}

resource "aws_subnet" "public_3" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.13.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1c"

  # Required for EKS. Instances launched into the subnet should be assigned a public IP address.
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn_pub-af-south-1c"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }
}

#### APP Subnets ####
# 
# APP EC2 Subnets
resource "aws_subnet" "private_1" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.21.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1a"

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pvt-app-ec2-af-south-1a"
    team    = var.team
    project = var.project
  }
}

resource "aws_subnet" "private_2" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.22.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1b"

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pvt-app-ec2-af-south-1b"
    team    = var.team
    project = var.project
  }
}

resource "aws_subnet" "private_3" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.23.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1c"

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pvt-app-ec2-af-south-1c"
    team    = var.team
    project = var.project
  }
}

# APP EKS Subnets
resource "aws_subnet" "private_4" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.24.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1a"

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn-pvt-app-eks-af-south-1a"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

resource "aws_subnet" "private_5" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.25.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1b"

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn-pvt-app-eks-af-south-1b"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

resource "aws_subnet" "private_6" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.26.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1c"

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn-pvt-app-eks-af-south-1c"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}


#### DB Subnets ####
# 
# DB EC2 Subnets
resource "aws_subnet" "private_7" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.31.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1a"

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pvt-db-ec2-af-south-1a"
    team    = var.team
    project = var.project
  }
}

resource "aws_subnet" "private_8" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.32.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1b"

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pvt-db-ec2-af-south-1b"
    team    = var.team
    project = var.project
  }
}

resource "aws_subnet" "private_9" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.33.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1c"

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pvt-db-ec2-af-south-1c"
    team    = var.team
    project = var.project
  }
}

# DB EKS Subnets
resource "aws_subnet" "private_10" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.34.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1a"

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn-pvt-db-eks-af-south-1a"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

resource "aws_subnet" "private_11" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.35.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1b"

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn-pvt-db-eks-af-south-1b"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

resource "aws_subnet" "private_12" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.36.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1c"

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn-pvt-db-eks-af-south-1c"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

#### Management Subnets ####
# 
# Management EC2 Subnets
resource "aws_subnet" "private_13" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.41.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1a"

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pvt-man-ec2-af-south-1a"
    team    = var.team
    project = var.project
  }
}

resource "aws_subnet" "private_14" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.42.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1b"

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pvt-man-ec2-af-south-1b"
    team    = var.team
    project = var.project
  }
}

resource "aws_subnet" "private_15" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.43.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1c"

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pvt-man-ec2-af-south-1c"
    team    = var.team
    project = var.project
  }
}

# DB EKS Subnets
resource "aws_subnet" "private_16" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.44.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1a"

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn-pvt-man-eks-af-south-1a"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

resource "aws_subnet" "private_17" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.45.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1b"

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn-pvt-man-eks-af-south-1b"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

resource "aws_subnet" "private_18" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.46.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1c"

  # A map of tags to assign to the resource.
  tags = {
    Name                                        = "sn-pvt-man-eks-af-south-1c"
    team                                        = var.team
    project                                     = var.project
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

#### Jumpserver Subnets ####
# 
resource "aws_subnet" "public_4" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.51.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1a"

  # Required for EKS. Instances launched into the subnet should be assigned a public IP address.
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pub-jserver-ec2-af-south-1a"
    team    = var.team
    project = var.project
  }
}

resource "aws_subnet" "public_5" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.7.52.0/24"

  # The AZ for the subnet.
  availability_zone = "af-south-1b"

  # Required for EKS. Instances launched into the subnet should be assigned a public IP address.
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name    = "sn-pub-jserver-ec2-af-south-1b"
    team    = var.team
    project = var.project
  }
}