##############################################################################################################
# Production VPC - Hub
##############################################################################################################
resource "aws_vpc" "SDWAN_VPC" {
  provider       = aws.virginia
  cidr_block           = var.hub_1_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name            = "${var.username}_Terraform_Hub_1_Prod_VPC"
    Resources_Owner = var.username
    Enviroment      = "Terraform Production"
  }
}

// Get all avaliable AZ's in the region variable

data "aws_availability_zones" "AZs" {
  provider = aws.virginia
  state = "available"
}

# IGW
resource "aws_internet_gateway" "prod_vpc_igw" {
  provider       = aws.virginia
  vpc_id = aws_vpc.SDWAN_VPC.id
  tags = {
    Name            = "${var.username}_Terraform_Hub_1_Prod_VPC_IGW"
    Resources_Owner = var.username
    Enviroment      = "Terraform Testing"
  }
}