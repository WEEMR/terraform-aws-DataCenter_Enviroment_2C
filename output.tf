# ----------- VPC  ----------- #

output "AWS_US_East_Hub_1_VPC_ID" {
    value = module.Hub_1_Prod_VPC.SDWAN_VPC
}

output "AWS_US_East_Spoke_1_VPC_ID" {
    value = module.Spoke_1_Prod_VPC.SDWAN_VPC
}

# ----------- hub 1  ----------- #

output "hub_1_WAN_1_EIP" {
  value       = module.hub_1.hub_1_WAN1
}

output "hub_1_WAN_2_EIP" {
  value       = module.hub_1.hub_1_WAN2
}

output "hub1_FGT_DNS_Name" {
  value = module.hub_1.hub1_FGT_DNS_Name
}

output "hub1_Linux_DNS_Name" {
  value = module.hub_1.hub1_Linux_DNS_Name
}

output "hub1_Windows_DNS_Name" {
  value = module.hub_1.hub1_Windows_Public
}

output "hub1_Windows_Password" {
  value = module.hub_1.hub1_Windows_Password
}

output "hub1_FMG_DNS_Name" {
  value = module.hub_1.hub1_FMG_Public
}

output "hub1_FAZ_DNS_Name" {
  value = module.hub_1.hub1_FAZ_Public
}

# ----------- spoke 1  ----------- #

output "spoke_1_WAN_1_EIP" {
  value       = module.spoke_1.spoke_1_WAN1
}

output "spoke_1_WAN_2_EIP" {
  value       = module.spoke_1.spoke_1_WAN2
}

output "spoke1_FGT_DNS_Name" {
  value = module.spoke_1.spoke1_FGT_DNS_Name
}

output "spoke1_Linux_DNS_Name" {
  value = module.spoke_1.spoke1_Linux_DNS_Name
}

output "spoke1_Windows_DNS_Name" {
  value = module.spoke_1.spoke1_Windows_Public
}

output "spoke1_Windows_Password" {
  value = module.spoke_1.spoke1_Windows_Password
}