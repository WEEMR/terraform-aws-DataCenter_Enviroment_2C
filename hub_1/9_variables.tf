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
variable "spoke_1_private_subnet_cidr" {}

# hub 1 Subnet IDs Dependencies

variable "hub_1_wan1_subnet_id" {}

variable "hub_1_wan2_subnet_id" {}

variable "hub_1_private_subnet_id" {}

variable "hub_1_pvt_rt_id" {}

# hub 1 Subnets CIDR Blocks

variable "hub_1_wan1_subnet_cidr" {}

variable "hub_1_wan2_subnet_cidr" {}

variable "hub_1_private_subnet_cidr" {}

# hub 1 Interfaces IPs 

variable "hub_1_wan1_pvt_ip" {}

variable "hub_1_wan2_pvt_ip" {}

variable "hub_1_lan_pvt_IP" {}

# Linux Interface IP 

variable "hub_1_Ubuntu_LAN_IP" {}

# Windows Server Interface IP

variable "hub_1_WinSrv_LAN_IP" {}

# FortiManager Interface IP

variable "hub_1_FMG_LAN_IP" {}

# FortiAnalyzer Interface IP

variable "hub_1_FAZ_LAN_IP" {}


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


#ami-0b9c648555f605b8a

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
    us-east-1 = "ami-059e523189e6aaec1"
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

variable "hub1_Configurations" {
  type    = string
  default = "hub1_fgtvm.conf"
}

# -------------------------------------------------------------- Windows Server Configuration File

variable "Windows_Server2019_Config" {
  type = string
  default = "WinSrv_conf"
}