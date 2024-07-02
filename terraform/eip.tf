resource "aws_eip" "erpnext_eip" {
  domain = "vpc"

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name        = "erpnext-${local.infra_env}-address"
    Project     = "erpnext"
    Environment = local.infra_env
    ManagedBy   = "terraform"
  }
}

resource "aws_eip_association" "erpnext_eip_assoc" {
  instance_id   = aws_instance.erpnext.id
  allocation_id = aws_eip.erpnext_eip.id
}
