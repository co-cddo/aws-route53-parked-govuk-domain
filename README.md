# aws-route53-parked-govuk-domain

For AWS Route53 DNS records for use on parked "gov.uk" domains.

Reference: <https://www.gov.uk/guidance/protect-domains-that-dont-send-email>

Reference: <https://www.ncsc.gov.uk/blog-post/protecting-parked-domains>

## Terraform module

### [route53-email-records.tf](terraform/route53-email-records.tf)

This reduces the likelihood that the domain could be a source
of successful email spoofing.

### [route53-webserver-records.tf](terraform/route53-webserver-records.tf)

Not yet implemented. Likely `CNAME` to a central redirecting CloudFront
distribution.

### Usage

You'll need an `aws_route53_zone` already, the below examples assume you've
called this `primary`.

Note: the use of the `//` is important to select the sub-directory.

``` terraform
module "co-cddo-aws-r53-parked-domain" {
  source                = "github.com/co-cddo/aws-route53-parked-govuk-domain//terraform?ref=829478ba8ed41863d7e5f526475de3e09171da4d"
  zone_id               = aws_route53_zone.primary.zone_id
}

# all variables
module "co-cddo-aws-r53-parked-domain" {
  source                = "github.com/co-cddo/aws-route53-parked-govuk-domain//terraform?ref=829478ba8ed41863d7e5f526475de3e09171da4d"
  zone_id               = aws_route53_zone.primary.zone_id
  depends_on            = aws_route53_zone.primary
  email_records         = true  # default
  webserver_records     = false # default
  additional_dmarc_ruas = []    # default, list of additional email addresses
  default_dmarc_record  = "v=DMARC1;p=reject;sp=reject;adkim=s;aspf=s;fo=1;rua=mailto:dmarc-rua@dmarc.service.gov.uk"
}
```
