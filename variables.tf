variable "logo_url" {
  type = string
}

variable "web_origins" {
  type    = list(string)
  default = []
}

variable "callback_urls" {
  type    = list(string)
  default = []
}

variable "twilio_sid" {
  type = string
}

variable "twilio_token" {
  type = string
}

variable "smtp_user" {
  type = string
}

variable "smtp_pass" {
  type = string
}
