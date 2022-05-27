
# Resource: aws_eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "nat1" {
  # EIP may require IGW to exist prior to association. 
  # Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.main]

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "eips-af-south-1a-${var.cluster_name}"
    }
  )
}

resource "aws_eip" "nat2" {
  # EIP may require IGW to exist prior to association. 
  # Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.main]


  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "eips-af-south-1b-${var.cluster_name}"
    }
  )

}

resource "aws_eip" "nat3" {
  # EIP may require IGW to exist prior to association. 
  # Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.main]

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "eips-af-south-1c-${var.cluster_name}"
    }
  )
}