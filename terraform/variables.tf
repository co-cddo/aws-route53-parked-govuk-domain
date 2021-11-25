variable "zone_id" {
  type = string
}

variable "email_records" {
  type = bool
  default = true
}

variable "webserver_records" {
  type = bool
  default = false
}

variable "default_dmarc_record" {
  type = string
  default = "v=DMARC1;p=reject;sp=reject;adkim=s;aspf=s;fo=1;rua=mailto:dmarc-rua@dmarc.service.gov.uk"
}

variable "additional_dmarc_ruas" {
  type = list
  default = []
}
