// Security Groups


resource "aws_default_security_group" "default_SG" {
  provider       = aws.virginia
  vpc_id = aws_vpc.SDWAN_VPC.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "${var.username}_SDWAN_Default_SG"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}


resource "aws_security_group" "Public_SG" {
  provider       = aws.virginia
  name        = "${var.username}_SDWAN_Public_Allow_SG"
  description = "Public Allow traffic"
  vpc_id      = aws_vpc.SDWAN_VPC.id

  dynamic "ingress" {
    for_each = var.Public_SG
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "${var.username}_SDWAN_Public_Allow_SG"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}

resource "aws_security_group" "Private_SG" {
  provider       = aws.virginia
  name        = "${var.username}_SDWAN_Private_SG"
  description = "Allow all traffic for the Private Subnet"
  vpc_id      = aws_vpc.SDWAN_VPC.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "${var.username}_SDWAN_Private_SG"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}

// FortiManager Security Group

resource "aws_security_group" "FMG_SG" {
  provider       = aws.virginia
  name        = "${var.username}_FortiManager_SG"
  description = "FortiManager_SG"
  vpc_id      = aws_vpc.SDWAN_VPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 541
    to_port     = 541
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "${var.username}_FortiManager_SG"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}
