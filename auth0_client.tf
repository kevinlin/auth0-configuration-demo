resource "auth0_client" "mobile_app" {
  allowed_clients      = []
  allowed_logout_urls  = []
  allowed_origins      = []
  app_type             = "native"
  callbacks            = []
  client_aliases       = []
  client_metadata      = {}
  cross_origin_auth    = false
  custom_login_page_on = true
  grant_types = [
    "authorization_code",
    "implicit",
    "refresh_token",
    "password",
    "http://auth0.com/oauth/grant-type/password-realm",
    "http://auth0.com/oauth/grant-type/passwordless/otp",
  ]
  is_first_party                      = true
  is_token_endpoint_ip_header_trusted = false
  logo_uri                            = var.logo_url
  name                                = "NextGen Mobile App"
  oidc_conformant                     = true
  sso                                 = false
  sso_disabled                        = false
  token_endpoint_auth_method          = "none"
  web_origins                         = []

  jwt_configuration {
    alg                 = "RS256"
    lifetime_in_seconds = 300
    scopes              = {}
    secret_encoded      = false
  }

  native_social_login {
    apple {
      enabled = false
    }

    facebook {
      enabled = false
    }
  }

  refresh_token {
    expiration_type              = "expiring"
    idle_token_lifetime          = 1296000
    infinite_idle_token_lifetime = true
    infinite_token_lifetime      = false
    leeway                       = 0
    rotation_type                = "non-rotating"
    token_lifetime               = 2592000
  }
}

resource "auth0_client" "web_app" {
  allowed_clients      = []
  allowed_logout_urls  = var.web_origins
  allowed_origins      = []
  app_type             = "spa"
  callbacks            = var.callback_urls
  client_aliases       = []
  client_metadata      = {}
  cross_origin_auth    = false
  custom_login_page_on = true
  grant_types = [
    "authorization_code",
    "implicit",
    "refresh_token",
    "password",
    "http://auth0.com/oauth/grant-type/password-realm",
  ]
  is_first_party                      = true
  is_token_endpoint_ip_header_trusted = false
  logo_uri                            = var.logo_url
  name                                = "NextGen Web App"
  oidc_conformant                     = true
  sso                                 = false
  sso_disabled                        = false
  token_endpoint_auth_method          = "none"
  web_origins                         = var.web_origins

  jwt_configuration {
    alg                 = "RS256"
    lifetime_in_seconds = 36000
    scopes              = {}
    secret_encoded      = false
  }

  refresh_token {
    expiration_type              = "non-expiring"
    idle_token_lifetime          = 1296000
    infinite_idle_token_lifetime = true
    infinite_token_lifetime      = true
    leeway                       = 0
    rotation_type                = "non-rotating"
    token_lifetime               = 2592000
  }
}