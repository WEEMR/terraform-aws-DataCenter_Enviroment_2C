output "hub_1_WAN1" {
  value       = aws_eip.hub_1_WAN1.public_ip
}

output "hub_1_WAN2" {
  value       = aws_eip.hub_1_WAN2.public_ip
}

output "hub1_FGT_DNS_Name" {
  value = aws_route53_record.hub1_FGT_Public_DNS.fqdn
}

output "hub1_Linux_DNS_Name" {
  value = aws_route53_record.hub1_Linux_Public.fqdn
}

output "hub1_WebServer_Public" {
  value = aws_route53_record.hub1_WebServer_Public.fqdn
}

output "hub1_Windows_Public" {
  value = aws_route53_record.hub1_Windows_Public.fqdn
}

output "hub1_Windows_Password" {
  value = aws_instance.hub_1_WinSrv.password_data
}

output "hub1_FMG_For_Spokes" {
  value = aws_route53_record.hub1_FMG_Public.fqdn
}

output "hub1_FAZ_For_Spokes" {
  value = aws_route53_record.hub1_FAZ_Public.fqdn
}

output "hub1_FMG_Public" {
  value = "https://${aws_route53_record.hub1_FMG_Public.fqdn}:4444"
}

output "hub1_FAZ_Public" {
  value = "https://${aws_route53_record.hub1_FAZ_Public.fqdn}:4445"
}