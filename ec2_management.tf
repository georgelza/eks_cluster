
#
resource "aws_instance" "jumpserver" {
  count                       = 1
  ami                         = "ami-030b8d2037063bab3" # Ubuntu 20.04
  instance_type               = "t3.small"
  key_name                    = aws_key_pair.my-pub-key.id
  vpc_security_group_ids      = [aws_security_group.sg_jumpserver_access.id, aws_security_group.sg_web.id]
  subnet_id                   = aws_subnet.public_4.id
  associate_public_ip_address = true

  root_block_device {
    volume_size           = 12
    delete_on_termination = true
  }


  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "asr-ap-jumpserver-az1"
    }
  )

  # Lets copy the pem file onto the jumpserver to be used to access other gosts

  provisioner "file" {
    source      = "/Users/george/Downloads/dev/devlab_aws/iamzanet.pem"
    destination = "/home/ubuntu/.ssh/${var.project}.pem"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/Users/george/Downloads/dev/devlab_aws/iamzanet.pem")
      host        = self.public_dns
    }
  }
  # Apply - chmod 400 iamzanet.pem
}


resource "aws_instance" "prometheus" {
  count                       = 1
  ami                         = "ami-030b8d2037063bab3" # Ubuntu 20.04
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.my-pub-key.id
  vpc_security_group_ids      = [aws_security_group.sg_jumpserver_access.id, aws_security_group.sg_web.id]
  subnet_id                   = aws_subnet.public_4.id
  associate_public_ip_address = false

  root_block_device {
    volume_size           = 20
    delete_on_termination = true
  }

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "asr-ap-prometheus"
    }
  )

}