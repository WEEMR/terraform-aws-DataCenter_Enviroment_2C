resource "aws_eip" "spoke_1_WAN1" {
  provider               = aws.spoke_1_vpc
  depends_on        = [aws_instance.spoke_1]
  vpc               = true
  network_interface = aws_network_interface.spoke_1_eth0_wan1.id

  tags = {
    Name       = "${var.username}_FGT_WAN"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}

resource "aws_eip" "spoke_1_WAN2" {
  provider               = aws.spoke_1_vpc
  depends_on        = [aws_instance.spoke_1]
  vpc               = true
  network_interface = aws_network_interface.spoke_1_eth1_wan2.id

  tags = {
    Name       = "${var.username}_FGT_WAN_WAN2"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}