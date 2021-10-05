data "aws_route53_zone" "Public_Hosted_Zone" {
  provider = aws.virginia
  name = var.Public_Hosted_Zone
}

resource "aws_route53_zone" "Public_SubHosted_Zone" {
  provider = aws.virginia
  name = var.SubHosted_Zone
}

resource "aws_route53_record" "activate_zone" {
  provider = aws.virginia
  zone_id = data.aws_route53_zone.Public_Hosted_Zone.zone_id
  name    = aws_route53_zone.Public_SubHosted_Zone.name
  type    = "NS"
  ttl     = "10"
  records = aws_route53_zone.Public_SubHosted_Zone.name_servers
}