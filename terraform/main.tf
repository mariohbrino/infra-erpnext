resource "aws_instance" "erpnext" {
  ami                    = data.aws_ami.erpnext.id
  instance_type          = var.instance_size
  key_name               = aws_key_pair.erpnext.key_name
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.public.id]

  root_block_device {
    volume_size = var.instance_root_device_size
    volume_type = "gp3"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "erpnext-${local.infra_env}"
    Project     = "erpnext"
    Environment = local.infra_env
    Role        = var.infra_role
    ManagedBy   = "terraform"
  }
}
