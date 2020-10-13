terraform {
  required_version = ">= 0.12"
}

provider "aviatrix" {
  controller_ip = var.controller_ip
  username      = var.username
  password      = var.password
  version       = "2.16.2"
}
