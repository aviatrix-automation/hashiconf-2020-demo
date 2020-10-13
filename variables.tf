# Variables required by the Aviatrix Provider
variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type    = string
  default = ""
}

variable "controller_ip" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "aws_account_name" {
  type    = string
  default = ""
}
