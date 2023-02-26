terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 0.43.0"
    }
  }
}

provider "auth0" {}

module "secrets" {
  source = "./secrets"
}
