# Access and secret keys to your environment
variable "access_key" {}
variable "secret_key" {}

# AWS Key Name to create Resources

variable "keyname" {}

# FortiGate Username and Password
variable "username" {}
variable "Password" {}

# Region 
variable "virginia_region" {}


# DNS Zone ID
variable "Public_SubHosted_Zone_id" {}

# Global Dependencies

variable "default_SG" {}
variable "Public_SG" {}
variable "Private_SG" {}
variable "hub_1_private_subnet_cidr" {}

# spoke 1 Subnet IDs Dependencies

variable "spoke_1_wan1_subnet_id" {}

variable "spoke_1_wan2_subnet_id" {}

variable "spoke_1_private_subnet_id" {}

variable "spoke_1_pvt_rt_id" {}

# spoke 1 Subnets CIDR Blocks

variable "spoke_1_wan1_subnet_cidr" {}

variable "spoke_1_wan2_subnet_cidr" {}

variable "spoke_1_private_subnet_cidr" {}

# spoke 1 Interfaces IPs 

variable "spoke_1_wan1_pvt_ip" {}

variable "spoke_1_wan2_pvt_ip" {}

variable "spoke_1_lan_pvt_IP" {}

# Linux Interface IP 

variable "spoke_1_Ubuntu_LAN_IP" {}

# Windows Server Interface IP

variable "spoke_1_WinSrv_LAN_IP" {}

# FMG and FAZ FQDNs

variable "hub1_FMG_For_Spokes" {}

variable "hub1_FAZ_For_Spokes" {}

# -------------------------------------------------------------- AMIs

# FortiGate AMI

variable "FGT_VM_AMI" {
  description = "FortiGate FGTVM-AWS(PAYG) - 7.0.1 AMI"
  type        = map
  default = {
    us-east-1 = "ami-0b9c648555f605b8a"
  }
}

#FGT 6.4.7 AMI 
#ami-0d480c4d334beff0e


// Ubuntu 20.04 LTS
variable "Ubuntu_WebServer_AMI" {
  description = "Ubuntu 20.04 LTS AMI"
  type        = map
  default = {
    us-east-1 = "ami-042e8287309f5df03"
  }
}

// AMIs are for WinSrv2019-Base
variable "WinSrv2019_ami" {
  type = map
  default = {
    us-east-1      = "ami-0b18ca1a93b538109"
  }
}

// AMIs are for Private FMG AWS - 7.0.1
variable "FMG_VM_AMI" {
  description = "Private - 7.0.1 AMI"
  type        = map
  default = {
    us-east-1 = "ami-0f0dd689a39a07493"
  }
}


// AMIs are for Private FAZ AWS - 7.0.1
variable "FAZ_VM_AMI" {
  description = "Private - 7.0.1 AMI"
  type        = map
  default = {
    us-east-1 = "ami-0da8f94dae97a1eec"
  }
}

# -------------------------------------------------------------- VM Sizes

# FortiGate VM Size

variable "FGT_VM_Size" {
  description = "FGT Instance Size"
  default     = "t3.small"
}

# Ubuntu VM Size

variable "Ubuntu_VM_Size" {
  description = "Ubuntu Instance Size"
  default     = "t3.micro"
}

# Windows VM Size

variable "WinSrv_VM_Size" {
  description = "Windows Server Instance Size"
  default     = "t3.medium"
}

# FortiManager VM Size

variable "FMG_VM_Size" {
  description = "FMG Instance Size"
  default     = "m5.large"
}

# FortiAnalyzer VM Size

variable "FAZ_VM_Size" {
  description = "FAZ Instance Size"
  default     = "t3.large"
}

# -------------------------------------------------------------- FGT Configuration File

variable "spoke1_Configurations" {
  type    = string
  default = "spoke1_fgtvm.conf"
}

# -------------------------------------------------------------- Windows Server Configuration File

variable "Windows_Server2019_Config" {
  type = string
  default = "WinSrv_conf"
}