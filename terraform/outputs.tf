output "default_subnet_id" {
  value = data.aws_subnets.default.ids[0]
}

output "app_eip" {
  value = aws_eip.erpnext_eip.public_ip
}

output "security_group_public" {
  value = aws_security_group.public.id
}

output "app_instance" {
  value = aws_instance.erpnext.id
}
