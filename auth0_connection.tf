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
    twilio_sid                     = module.secrets.twilio_sid
    twilio_token                   = module.secrets.twilio_token
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

resource "auth0_connection" "email" {
  is_domain_connection = false
  metadata             = {}
  name                 = "email"
  strategy             = "email"

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
    from                           = "{{ application.name }} <support@nextgen.com>"
    import_mode                    = false
    ips                            = []
    name                           = "email"
    non_persistent_attrs           = []
    pkce_enabled                   = false
    requires_username              = false
    scopes                         = []
    scripts                        = {}
    sign_saml_request              = false
    strategy_version               = 0
    subject                        = "Welcome to {{ application.name }}"
    syntax                         = "liquid"
    template                       = <<-EOT
            <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml">
              <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <style type="text/css">.ExternalClass,.ExternalClass div,.ExternalClass font,.ExternalClass p,.ExternalClass span,.ExternalClass td,img{line-height:100%}#outlook a{padding:0}.ExternalClass,.ReadMsgBody{width:100%}a,blockquote,body,li,p,table,td{-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}table,td{mso-table-lspace:0;mso-table-rspace:0}img{-ms-interpolation-mode:bicubic;border:0;height:auto;outline:0;text-decoration:none}table{border-collapse:collapse!important}#bodyCell,#bodyTable,body{height:100%!important;margin:0;padding:0;font-family:ProximaNova,sans-serif}#bodyCell{padding:20px}#bodyTable{width:600px}@font-face{font-family:ProximaNova;src:url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-regular-webfont-webfont.eot);src:url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-regular-webfont-webfont.eot?#iefix) format('embedded-opentype'),url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-regular-webfont-webfont.woff) format('woff');font-weight:400;font-style:normal}@font-face{font-family:ProximaNova;src:url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-semibold-webfont-webfont.eot);src:url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-semibold-webfont-webfont.eot?#iefix) format('embedded-opentype'),url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-semibold-webfont-webfont.woff) format('woff');font-weight:600;font-style:normal}@media only screen and (max-width:480px){#bodyTable,body{width:100%!important}a,blockquote,body,li,p,table,td{-webkit-text-size-adjust:none!important}body{min-width:100%!important}#bodyTable{max-width:600px!important}#signIn{max-width:280px!important}}
            </style>
              </head>
              <body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0" style="-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;margin: 0;padding: 0;font-family: &quot;ProximaNova&quot;, sans-serif;height: 100% !important;"><center>
              <table style="width: 600px;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;font-family: &quot;ProximaNova&quot;, sans-serif;border-collapse: collapse !important;height: 100% !important;" align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable">
                <tr>
                  <td align="center" valign="top" id="bodyCell" style="-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 20px;font-family: &quot;ProximaNova&quot;, sans-serif;height: 100% !important;">
                  <div class="main">
                    <p style="text-align: center;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%; margin-bottom: 30px;">
                      <img src="https://cdn.auth0.com/styleguide/2.0.9/lib/logos/img/badge.png" width="50" alt="Your logo goes here" style="-ms-interpolation-mode: bicubic;border: 0;height: auto;line-height: 100%;outline: none;text-decoration: none;">
                    </p>

                    <!-- Email change content -->
                    {% if operation == 'change_email' %}

                      <p style="font-size: 1.2em;line-height: 1.3;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;">Your email address has been updated.</p>

                    {% else %}

                      <!-- Signup email content -->
                      {% if send == 'link' or send == 'link_ios' or send == 'link_android' %}

                        <p style="font-size: 1.2em;line-height: 1.3;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;">Click and confirm that you want to sign in to {{ application.name }}. This link will expire in three minutes.</p>

                        <div style="text-align:center">
                        <a id="signIn" style="text-transform: uppercase;letter-spacing: 1px;color: #ffffff;text-decoration: none;display: inline-block;min-height: 48px;line-height: 48px;padding-top: 0;padding-right: 26px;padding-bottom: 0;margin: 20px 0;padding-left: 26px;border: 0;outline: 0;background: #eb5424;font-size: 14px;font-style: normal;font-weight: 400;text-align: center;white-space: nowrap;border-radius: 3px;text-overflow: ellipsis;max-width: 280px;overflow: hidden;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;" href="{{ link }}">Sign in to {{ application.name }}</a>
                        </div>

                        <p style="-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;">Or sign in using this link:</p>
                        <p style="-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;"><a style="font-size: 12px; color: #A9B3BC; text-decoration: none;word-break: break-all;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;" href="{{ link }}">{{ link }}</a></p>

                        {% elsif send == 'code' %}

                        <p style="font-size: 1.4em; line-height: 1.3;">Your verification code is: <b>{{ code }}</b></p>

                      {% endif %}

                    {% endif %}

                    <p style="-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;">If you are having any issues with your account, please don't hesitate to contact us by replying to this mail.</p>

                    <br>
                    Thanks!
                    <br>

                    <strong>{{ application.name }}</strong>

                    <br><br>
                    <hr style="border: 2px solid #EAEEF3; border-bottom: 0; margin: 20px 0;">
                    <p style="text-align: center;color: #A9B3BC;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;">
                      If you did not make this request, please contact us by replying to this mail.
                    </p>
                  </div>
                  </td>
                </tr>
              </table>
            </center>
            </body>
            </html>
        EOT
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