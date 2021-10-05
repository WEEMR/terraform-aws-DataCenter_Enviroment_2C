// -------------------------------------------------------------------------------------------------------------  Subnets 

// ------------------------------------------------------------------------------ hub 1 Subnets

// hub 1 Public Subnet 1

resource "aws_subnet" "hub_1_wan1_subnet" {
  provider          = aws.virginia
  vpc_id            = aws_vpc.SDWAN_VPC.id
  cidr_block        = var.hub_1_wan1_subnet_cidr
  availability_zone = data.aws_availability_zones.AZs.names[0]
  tags = {
    Name       = "${var.username}_Terraform_SDAWN_hub_1_WAN_1"
    reference  = "hub_1_wan1_subnet" 
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}

// hub 1 Public Subnet 2

resource "aws_subnet" "hub_1_wan2_subnet" {
  provider          = aws.virginia
  vpc_id            = aws_vpc.SDWAN_VPC.id
  cidr_block        = var.hub_1_wan2_subnet_cidr
  availability_zone = data.aws_availability_zones.AZs.names[0]
  tags = {
    Name       = "${var.username}_Terraform_SDAWN_hub_1_WAN_2"
    reference  = "hub_1_wan2_subnet" 
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}

// -------------------------- hub 1 Public Subnets Association with RT

resource "aws_route_table_association" "hub_1_wan1_RT_association" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.hub_1_wan1_subnet.id
  route_table_id = aws_default_route_table.public_subnets_RT.id
}

// Public Subnet 2 Association

resource "aws_route_table_association" "hub_1_wan2_RT_association" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.hub_1_wan2_subnet.id
  route_table_id = aws_default_route_table.public_subnets_RT.id
}


// hub 1 Private Subnet

resource "aws_subnet" "hub_1_private_subnet" {
  provider          = aws.virginia
  vpc_id            = aws_vpc.SDWAN_VPC.id
  cidr_block        = var.hub_1_private_subnet_cidr
  availability_zone = data.aws_availability_zones.AZs.names[0]
  tags = {
    Name       = "${var.username}_Terraform_SDAWN_hub_1_Private_Subnet"
    reference  = "hub_1_private_subnet" 
    Owner      = var.username
    Enviroment = "Terraform Testing"

  }
}

// -------------------------- hub 1 Private Subnet Association with RT


// Virginia Private Subnet 1 Association 

resource "aws_route_table_association" "Hub_1_private_RT_association" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.hub_1_private_subnet.id
  route_table_id = aws_route_table.hub_1_pvt_rt.id
}