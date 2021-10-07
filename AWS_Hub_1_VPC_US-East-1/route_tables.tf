// Virgina Public Route Table  (Main / Default Route Table)

resource "aws_default_route_table" "public_subnets_RT" {
  provider       = aws.virginia
  default_route_table_id = aws_vpc.SDWAN_VPC.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_vpc_igw.id
  }

  tags = {
    Name       = "${var.username}_Terraform_Hub_1_public_subnets_RT"
    Owner      = var.username
    Enviroment = "Terraform Testing"
    Region     = "US East 1"
  }
}

// Hub1 Private Subnet Route Table

resource "aws_route_table" "hub_1_pvt_rt" {
  provider       = aws.virginia
  vpc_id = aws_vpc.SDWAN_VPC.id

  tags = {
    Name       = "${var.username}_hub_1_pvt_rt"
    reference  = "hub_1_pvt_rt"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}