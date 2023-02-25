resource "auth0_connection" "sms" {
  is_domain_connection = false
  metadata             = {}
  name                 = "sms"
  strategy             = "sms"

  options {
    allowed_audiences              = []
    api_enable_users               = false
    auth_params                    = {}
    brute_force_protection         = true
    custom_scripts                 = {}
    debug                          = false
    disable_cache                  = false
    disable_sign_out               = false
    disable_signup                 = false
    domain_aliases                 = []
    enable_script_context          = false
    enabled_database_customization = false
    forward_request_info           = false
    from                           = "+12184223634"
    import_mode                    = false
    ips                            = []
    name                           = "sms"
    non_persistent_attrs           = []
    pkce_enabled                   = false
    requires_username              = false
    scopes                         = []
    scripts                        = {}
    sign_saml_request              = false
    strategy_version               = 0
    syntax                         = "md_with_macros"
    template                       = <<-EOT
            Your verification code is: @@password@@
        EOT
    twilio_sid                     = var.twilio_sid
    twilio_token                   = var.twilio_token
    use_cert_auth                  = false
    use_kerberos                   = false
    use_wsfed                      = false
    waad_common_endpoint           = false

    totp {
      length    = 6
      time_step = 180
    }
  }
}