module "Hub_1_Prod_VPC" {
  source                       = "./AWS_Hub_1_VPC_US-East-1"
  access_key                   = var.access_key
  secret_key                   = var.secret_key
  username                     = var.username
  virginia_region              = var.virginia_region
  Public_Hosted_Zone           = var.Public_Hosted_Zone
  SubHosted_Zone               = var.SubHosted_Zone

  # VPC CIDR & Subnets

  hub_1_vpc_cidr                = var.hub_1_vpc_cidr
  # hub 1
  hub_1_wan1_subnet_cidr       = var.hub_1_wan1_subnet_cidr
  hub_1_wan2_subnet_cidr       = var.hub_1_wan2_subnet_cidr
  hub_1_private_subnet_cidr    = var.hub_1_private_subnet_cidr
}

module "hub_1" {
  source                       = "./hub_1"
  access_key                   = var.access_key
  secret_key                   = var.secret_key

  # Global dependencies

  username                     = var.username
  Password                     = var.Password
  keyname                      = var.keyname
  virginia_region              = var.virginia_region
  Public_SubHosted_Zone_id     = module.Hub_1_Prod_VPC.Public_SubHosted_Zone_id

  # Security Groups 
  
  default_SG                   = module.Hub_1_Prod_VPC.default_SG
  Public_SG                    = module.Hub_1_Prod_VPC.Public_SG
  Private_SG                   = module.Hub_1_Prod_VPC.Private_SG
  
  # hub 1 Specific dependencies

  hub_1_wan1_subnet_cidr       = var.hub_1_wan1_subnet_cidr
  hub_1_wan2_subnet_cidr       = var.hub_1_wan2_subnet_cidr
  hub_1_private_subnet_cidr    = var.hub_1_private_subnet_cidr

  hub_1_wan1_subnet_id         = module.Hub_1_Prod_VPC.hub_1_wan1_subnet_id
  hub_1_wan2_subnet_id         = module.Hub_1_Prod_VPC.hub_1_wan2_subnet_id
  hub_1_private_subnet_id      = module.Hub_1_Prod_VPC.hub_1_private_subnet_id
  hub_1_pvt_rt_id              = module.Hub_1_Prod_VPC.hub_1_pvt_rt_id


  # FGT, Ubuntu, Windows and FMG Private IPs

  hub_1_wan1_pvt_ip              = var.hub_1_wan1_pvt_ip
  hub_1_wan2_pvt_ip              = var.hub_1_wan2_pvt_ip
  hub_1_lan_pvt_IP               = var.hub_1_lan_pvt_IP
  hub_1_Ubuntu_LAN_IP            = var.hub_1_Ubuntu_LAN_IP
  hub_1_WinSrv_LAN_IP            = var.hub_1_WinSrv_LAN_IP
  hub_1_FMG_LAN_IP               = var.hub_1_FMG_LAN_IP
  hub_1_FAZ_LAN_IP               = var.hub_1_FAZ_LAN_IP

}



module "Spoke_1_Prod_VPC" {
  source                       = "./AWS_Spoke_1_VPC_US-East-1"
  access_key                   = var.access_key
  secret_key                   = var.secret_key
  username                     = var.username
  virginia_region              = var.virginia_region
  Public_Hosted_Zone           = var.Public_Hosted_Zone
  SubHosted_Zone               = var.SubHosted_Zone

  # VPC CIDR & Subnets

  spoke_1_vpc_cidr                = var.spoke_1_vpc_cidr

  # Spoke 1
  spoke_1_wan1_subnet_cidr     = var.spoke_1_wan1_subnet_cidr
  spoke_1_wan2_subnet_cidr     = var.spoke_1_wan2_subnet_cidr
  spoke_1_private_subnet_cidr  = var.spoke_1_private_subnet_cidr
}



module "spoke_1" {
  source                         = "./spoke_1"
  access_key                     = var.access_key
  secret_key                     = var.secret_key

  # Global dependencies

  username                       = var.username
  Password                       = var.Password
  keyname                        = var.keyname
  virginia_region                = var.virginia_region
  Public_SubHosted_Zone_id       = module.Hub_1_Prod_VPC.Public_SubHosted_Zone_id
  hub1_FMG_For_Spokes            = module.hub_1.hub1_FMG_For_Spokes
  hub1_FAZ_For_Spokes            = module.hub_1.hub1_FAZ_For_Spokes

  # Security Groups 
  
  default_SG                     = module.Spoke_1_Prod_VPC.default_SG
  Public_SG                      = module.Spoke_1_Prod_VPC.Public_SG
  Private_SG                     = module.Spoke_1_Prod_VPC.Private_SG
  
  # spoke 1 Specific dependencies

  spoke_1_wan1_subnet_cidr       = var.spoke_1_wan1_subnet_cidr
  spoke_1_wan2_subnet_cidr       = var.spoke_1_wan2_subnet_cidr
  spoke_1_private_subnet_cidr    = var.spoke_1_private_subnet_cidr

  spoke_1_wan1_subnet_id         = module.Spoke_1_Prod_VPC.spoke_1_wan1_subnet_id
  spoke_1_wan2_subnet_id         = module.Spoke_1_Prod_VPC.spoke_1_wan2_subnet_id
  spoke_1_private_subnet_id      = module.Spoke_1_Prod_VPC.spoke_1_private_subnet_id
  spoke_1_pvt_rt_id              = module.Spoke_1_Prod_VPC.spoke_1_pvt_rt_id


  # FGT, Ubuntu, Windows and FMG Private IPs

  spoke_1_wan1_pvt_ip            = var.spoke_1_wan1_pvt_ip
  spoke_1_wan2_pvt_ip            = var.spoke_1_wan2_pvt_ip
  spoke_1_lan_pvt_IP             = var.spoke_1_lan_pvt_IP
  spoke_1_Ubuntu_LAN_IP          = var.spoke_1_Ubuntu_LAN_IP
  spoke_1_WinSrv_LAN_IP          = var.spoke_1_WinSrv_LAN_IP

}