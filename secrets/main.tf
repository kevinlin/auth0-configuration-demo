terraform {
  required_providers {
    sops = {
      source = "carlpett/sops"
      version = "~> 0.5"
    }
  }
}

data "sops_file" "secrets" {
  source_file = "${terraform.workspace}-secrets.enc.yaml"
}

output "twilio_sid" {
  value = data.sops_file.secrets.data["twilio_sid"]
}

output "twilio_token" {
  value = data.sops_file.secrets.data["twilio_token"]
}

output "smtp_user" {
  value = data.sops_file.secrets.data["smtp_user"]
}

output "smtp_pass" {
  value = data.sops_file.secrets.data["smtp_pass"]
}
