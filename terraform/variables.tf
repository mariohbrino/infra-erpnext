locals {
  infra_env = terraform.workspace == "default" ? "sandbox" : terraform.workspace
}

variable "infra_role" {
  type        = string
  description = "Infrastructure purpose"
}

variable "instance_size" {
  type        = string
  description = "ec2 web server size"
  default     = "t3.small"
}

variable "instance_root_device_size" {
  type        = number
  description = "Root block device size in GB"
  default     = 8
}

variable "key_name" {
  type        = string
  description = "SSH key pair"
}
