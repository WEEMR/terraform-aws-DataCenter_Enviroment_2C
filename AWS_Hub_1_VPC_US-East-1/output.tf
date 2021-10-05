// ------------------------------- VPC

output "SDWAN_VPC" {
  value       = aws_vpc.SDWAN_VPC.id
}

// ------------------------------- DNS

output "Public_SubHosted_Zone_id" {
  value = aws_route53_zone.Public_SubHosted_Zone.id
}


// ------------------------------- Security Groups 


output "default_SG" {
  value = aws_default_security_group.default_SG.id
}

output "Public_SG" {
  value = aws_security_group.Public_SG.id
}

output "Private_SG" {
  value = aws_security_group.Private_SG.id
}

output "FMG_SG" {
  value = aws_security_group.FMG_SG.id
}

// ------------------------------- hub 1

output "hub_1_wan1_subnet_id" {
  value       = aws_subnet.hub_1_wan1_subnet.id
}

output "hub_1_wan2_subnet_id" {
  value       = aws_subnet.hub_1_wan2_subnet.id
}

output "hub_1_private_subnet_id" {
  value       = aws_subnet.hub_1_private_subnet.id
}

output "hub_1_pvt_rt_id" {
  value       = aws_route_table.hub_1_pvt_rt.id
}