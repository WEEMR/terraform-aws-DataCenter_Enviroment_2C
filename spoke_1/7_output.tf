output "spoke_1_WAN1" {
  value       = aws_eip.spoke_1_WAN1.public_ip
}

output "spoke_1_WAN2" {
  value       = aws_eip.spoke_1_WAN2.public_ip
}

output "spoke1_FGT_DNS_Name" {
  value = aws_route53_record.spoke1_FGT_Public_DNS.fqdn
}

output "spoke1_Linux_DNS_Name" {
  value = aws_route53_record.spoke1_Linux_Public.fqdn
}

output "spoke1_WebServer_Public" {
  value = aws_route53_record.spoke1_WebServer_Public.fqdn
}

output "spoke1_Windows_Public" {
  value = aws_route53_record.spoke1_Windows_Public.fqdn
}

output "spoke1_Windows_Password" {
  value = aws_instance.spoke_1_WinSrv.password_data
}