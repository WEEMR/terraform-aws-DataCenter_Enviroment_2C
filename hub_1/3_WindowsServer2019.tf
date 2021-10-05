// Hub 1 Windows Server 2019

resource "aws_network_interface" "hub1_WinSrv_eth0" {
  provider = aws.virginia
  description = "WinSrv2019"
  subnet_id   = var.hub_1_private_subnet_id
  private_ips = var.hub_1_WinSrv_LAN_IP
  security_groups = [var.Private_SG]
  
  tags = {
    Name = "${var.username}_TF_hub_1_WinSrv"
    Owner = var.username
    Enviroment = "${var.username}"
  }
}

resource "time_sleep" "Windows_wait_3mins" {
  depends_on      = [aws_instance.hub_1]
  create_duration = "180s"
}


resource "aws_instance" "hub_1_WinSrv" {
  provider          = aws.virginia
  depends_on        = [time_sleep.Windows_wait_3mins]
  ami               = lookup(var.WinSrv2019_ami, var.virginia_region)
  instance_type     = var.WinSrv_VM_Size
  availability_zone = data.aws_availability_zones.AZs.names[0]
  key_name          = var.keyname
  get_password_data = true
  user_data         = data.template_file.Windows_Server2019_Config.rendered

  root_block_device {
    volume_type = "standard"
    volume_size = "30"
  }
  
  
  network_interface {
    network_interface_id = aws_network_interface.hub1_WinSrv_eth0.id
    device_index         = 0
  }


  tags = {
    Name = "${var.username}_TF_hub_1_WinSrv2019"
  }
}

data "template_file" "Windows_Server2019_Config" {
  template = file(var.Windows_Server2019_Config)
}