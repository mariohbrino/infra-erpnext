resource "ansible_host" "erpnext" {
  name   = aws_eip.erpnext_eip.public_ip
  groups = ["erpnext"]

  variables = {
    ansible_user                 = "ubuntu"
    ansible_host                 = aws_eip.erpnext_eip.public_ip
    ansible_python_interpreter   = "/usr/bin/python3.10"
    ansible_ssh_private_key_file = "~/.ssh/erpnext"
  }
}
