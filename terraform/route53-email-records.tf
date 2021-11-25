resource "aws_route53_record" "spf-record" {
  count   = "${var.email_records ? 1 : 0}"
  zone_id = var.zone_id
  name    = "."
  type    = "TXT"
  ttl     = "60"
  records = ["v=spf1 -all"]
}

resource "aws_route53_record" "dmarc-record" {
  count   = "${var.email_records ? 1 : 0}"
  zone_id = var.zone_id
  name    = "_dmarc"
  type    = "TXT"
  ttl     = "60"
  records = ["v=DMARC1;p=reject;rua=mailto:dmarc-rua@dmarc.service.gov.uk;"]
}

resource "aws_route53_record" "null-mx-record" {
  count   = "${var.email_records ? 1 : 0}"
  zone_id = var.zone_id
  name    = "."
  type    = "MX"
  ttl     = "60"
  records = ["0 ."]
}

resource "aws_route53_record" "dkim-record" {
  count   = "${var.email_records ? 1 : 0}"
  zone_id = var.zone_id
  name    = "*._domainkey"
  type    = "TXT"
  ttl     = "60"
  records = ["v=DKIM1; p="]
}

resource "aws_route53_record" "dkim-signing-required-record" {
  count   = "${var.email_records ? 1 : 0}"
  zone_id = var.zone_id
  name    = "_domainkey"
  type    = "TXT"
  ttl     = "60"
  records = ["o=-"]
}