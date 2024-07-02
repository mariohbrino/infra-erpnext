resource "aws_key_pair" "erpnext" {
  key_name   = "erpnext"
  public_key = var.key_name
}
