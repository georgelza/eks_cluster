#https://registry.terraform.io/modules/terraform-aws-modules/key-pair/aws/latest


resource "aws_key_pair" "my-pub-key" {
  key_name   = var.project
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCh0yOuNlCb0KVC0pN4wteHHnPlFQjyUyu8DslCfdtzV25joEQ3kcVZbRMhvE18E8Zx7QhQwB8ZrkgIO3muN+/ulPsaqFdtNpJKQUsD9k6phCBMOTFYVI5C0sIMR6mbWKbLb79tbmjR0VlFr6WUrHDEYTk065TvMBOsTWKE1jHIktEITT9DU1MTZJ/PZvueMZ5vqSCAZKnpIt3niOSknMf0Por1DmOgMGy3/ZccpXCB7BMrt7N9WE6E3C9/vrDC98Nn6o9JLu9wEGVxfs4ec+N4kXAJplVos3l+rIWq0U2kVKhAOkZpX6gc6sr2NYdhBoxS0almzzsHN2j5N+CfWWir iamzanet_jumpserver_az1"

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,
    {
      Name = "${var.project}-keypair"
    }
  )

}