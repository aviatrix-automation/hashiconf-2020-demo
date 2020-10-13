// HashiConf Digital 2020 Demo

# AWS VPC
resource "aviatrix_vpc" "default" {
  cloud_type           = 1
  name                 = "hashiconf-demo"
  region               = var.region
  cidr                 = "10.0.0.0/16"
  account_name         = var.aws_account_name # Name of AWS account defined in Aviatrix Controller
  aviatrix_firenet_vpc = false
  aviatrix_transit_vpc = false

  provisioner "local-exec" {
    command = "aws ec2 describe-vpcs --vpc-id ${aviatrix_vpc.default.vpc_id} --output table >> describe-vpcs.txt"
  }
  
  provisioner "local-exec" {
    command = "aws ec2 describe-subnets --filters Name=vpc-id,Values=${aviatrix_vpc.default.vpc_id} --output table >> describe-subnets.txt"
  }

  provisioner "local-exec" {
    command = "aws ec2 describe-route-tables --filters Name=vpc-id,Values=${aviatrix_vpc.default.vpc_id} --output table >> describe-route-tables.txt"
  }
  
}
