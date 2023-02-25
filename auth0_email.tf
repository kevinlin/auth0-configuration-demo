resource "auth0_email" "smtp_email_provider" {
  default_from_address = "support@nextgen.com"
  enabled              = true
  name                 = "smtp"

  credentials {
    smtp_host = "email-smtp.ap-southeast-1.amazonaws.com"
    smtp_port = 587
    smtp_user = var.smtp_user
    smtp_pass = var.smtp_pass
  }
}