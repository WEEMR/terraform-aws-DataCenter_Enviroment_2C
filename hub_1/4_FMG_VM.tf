// FGTVM instance

resource "aws_network_interface" "hub1_FMG_eth0" {
  provider    = aws.virginia
  description = "${var.username}_Terraform_hub_1_FMG_WAN"
  subnet_id   = var.hub_1_private_subnet_id
  private_ips = var.hub_1_FMG_LAN_IP
  security_groups = [var.Private_SG]

  tags = {
    Name = "${var.username}_TF_hub_1_FMG_WAN"
  }
}

resource "aws_instance" "WRady_Terraform_FMG" {
  provider    = aws.virginia
  ami               = lookup(var.FMG_VM_AMI, var.virginia_region)
  instance_type     = var.FMG_VM_Size
  availability_zone = data.aws_availability_zones.AZs.names[0]
  key_name          = var.keyname

  root_block_device {
    volume_type = "standard"
    volume_size = "5"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "80"
    volume_type = "standard"
  }

  network_interface {
    network_interface_id = aws_network_interface.hub1_FMG_eth0.id
    device_index         = 0
  }

  tags = {
    Name = "${var.username}_TF_hub_1_FMG"
  }
}
