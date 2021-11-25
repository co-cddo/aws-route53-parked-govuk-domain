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
