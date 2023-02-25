resource "auth0_email_template" "verify_email" {
  depends_on                = [auth0_email.smtp_email_provider]
  body                      = <<-EOT
        <html>
          <head>
            <style type="text/css">
              .ExternalClass,.ExternalClass div,.ExternalClass font,.ExternalClass p,.ExternalClass span,.ExternalClass td,img {line-height: 100%;}#outlook a {padding: 0;}.ExternalClass,.ReadMsgBody {width: 100%;}a,blockquote,body,li,p,table,td {-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;}table,td {mso-table-lspace: 0;mso-table-rspace: 0;}img {-ms-interpolation-mode: bicubic;border: 0;height: auto;outline: 0;text-decoration: none;}table {border-collapse: collapse !important;}#bodyCell,#bodyTable,body {height: 100% !important;margin: 0;padding: 0;font-family: ProximaNova, sans-serif;}#bodyCell {padding: 20px;}#bodyTable {width: 600px;}@font-face {font-family: ProximaNova;src: url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-regular-webfont-webfont.eot);src: url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-regular-webfont-webfont.eot?#iefix)format("embedded-opentype"),url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-regular-webfont-webfont.woff) format("woff");font-weight: 400;font-style: normal;}@font-face {font-family: ProximaNova;src: url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-semibold-webfont-webfont.eot);src: url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-semibold-webfont-webfont.eot?#iefix)format("embedded-opentype"),url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-semibold-webfont-webfont.woff) format("woff");font-weight: 600;font-style: normal;}@media only screen and (max-width: 480px) {#bodyTable,body {width: 100% !important;}a,blockquote,body,li,p,table,td {-webkit-text-size-adjust: none !important;}body {min-width: 100% !important;}#bodyTable {max-width: 600px !important;}#signIn {max-width: 280px !important;}}
            </style>
          </head>
          <body>
            <center>
              <table
                style='width: 600px;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;font-family: "ProximaNova", sans-serif;border-collapse: collapse !important;height: 100% !important;'
                align="center"
                border="0"
                cellpadding="0"
                cellspacing="0"
                height="100%"
                width="100%"
                id="bodyTable"
              >
                <tr>
                  <td
                    align="center"
                    valign="top"
                    id="bodyCell"
                    style='-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 20px;font-family: "ProximaNova", sans-serif;height: 100% !important;'
                  >
                    <div class="main">
                      <p
                        style="text-align: center;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%; margin-bottom: 30px;"
                      >
                        <img
                          src="${var.logo_url}"
                          width="50"
                          alt="Your logo goes here"
                          style="-ms-interpolation-mode: bicubic;border: 0;height: auto;line-height: 100%;outline: none;text-decoration: none;"
                        />
                      </p>

                      <h1>Welcome to NextGen!</h1>

                      <p>Thank you for signing up. Please verify your email address by clicking the following link:</p>

                      <p><a href="{{ url }}">Confirm my account</a></p>

                      <p>
                        If you are having any issues with your account, please don’t hesitate to contact us by replying to
                        this mail.
                      </p>

                      <br />
                      Thanks!
                      <br />

                      <strong>Welcome to NextGen!</strong>

                      <br /><br />
                      <hr style="border: 2px solid #EAEEF3; border-bottom: 0; margin: 20px 0;" />
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
  enabled                   = false
  from                      = "{{ application.name }} <support@nextgen.com>"
  include_email_in_redirect = false
  subject                   = ""
  syntax                    = "liquid"
  template                  = "verify_email"
  url_lifetime_in_seconds   = 432000
}

resource "auth0_email_template" "verify_email_by_code" {
  depends_on                = [auth0_email.smtp_email_provider]
  body                      = <<-EOT
        <!DOCTYPE html>
        <html
          xmlns="http://www.w3.org/1999/xhtml"
          xmlns:v="urn:schemas-microsoft-com:vml"
          xmlns:o="urn:schemas-microsoft-com:office:office"
        >
          <head>
            <title> </title>
            <!--[if !mso]><!-- -->
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <!--<![endif]-->
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <style type="text/css">
              #outlook a {padding: 0;}.ReadMsgBody {width: 100%;}.ExternalClass {width: 100%;}.ExternalClass * {line-height: 100%;}body {margin: 0;padding: 0;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;}table,td {border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;}img {border: 0;height: auto;line-height: 100%;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;}p {display: block;margin: 13px 0;}</style><!--[if !mso]><!--><style type="text/css">@media only screen and (max-width: 480px) {@-ms-viewport {width: 320px;}@viewport {width: 320px;}}</style><!--<![endif]--><!--[if mso]><xml><o:OfficeDocumentSettings><o:AllowPNG /><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--><!--[if lte mso 11]><style type="text/css">.outlook-group-fix {width: 100% !important;}</style><![endif]--><style type="text/css">@media only screen and (min-width: 480px) {.mj-column-per-100 {width: 100% !important;max-width: 100%;}.mj-column-per-80 {width: 80% !important;max-width: 80%;}}</style><style type="text/css">@media only screen and (max-width: 480px) {table.full-width-mobile {width: 100% !important;}td.full-width-mobile {width: auto !important;}}
            </style>
          </head>

          <body style="background-color:#E3E5E7;">
            <div style="background-color:#E3E5E7;">
              <!--[if mso | IE]>
            <table
               align="center" border="0" cellpadding="0" cellspacing="0" class="" style="width:600px;" width="600"
            >
              <tr>
                <td style="line-height:0px;font-size:0px;mso-line-height-rule:exactly;">
            <![endif]-->

              <div style="background:white;background-color:white;Margin:0px auto;max-width:600px;">
                <table
                  align="center"
                  border="0"
                  cellpadding="0"
                  cellspacing="0"
                  role="presentation"
                  style="background:white;background-color:white;width:100%;"
                >
                  <tbody>
                    <tr>
                      <td style="direction:ltr;font-size:0px;padding:20px 0;text-align:center;vertical-align:top;">
                        <!--[if mso | IE]>
                        <table role="presentation" border="0" cellpadding="0" cellspacing="0">

              <tr>

                  <td
                     class="" style="vertical-align:top;width:600px;"
                  >
                <![endif]-->

                        <div
                          class="mj-column-per-100 outlook-group-fix"
                          style="font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;"
                        >
                          <table
                            border="0"
                            cellpadding="0"
                            cellspacing="0"
                            role="presentation"
                            style="vertical-align:top;"
                            width="100%"
                          >
                            <tr>
                              <td align="center" style="font-size:0px;padding:10px 25px;word-break:break-word;">
                                <table
                                  border="0"
                                  cellpadding="0"
                                  cellspacing="0"
                                  role="presentation"
                                  style="border-collapse:collapse;border-spacing:0px;"
                                >
                                  <tbody>
                                    <tr>
                                      <td style="width:80px;">
                                        <a href="{{ home_url | escape }}" target="_blank">
                                          <img
                                            alt="auth0"
                                            height="auto"
                                            src="http://cdn.auth0.com/styleguide/latest/lib/logos/img/logo-blue.png"
                                            style="border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;"
                                            width="80"
                                          />
                                        </a>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </div>

                        <!--[if mso | IE]>
                  </td>

              </tr>

                        </table>
                      <![endif]-->
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!--[if mso | IE]>
                </td>
              </tr>
            </table>

            <table
               align="center" border="0" cellpadding="0" cellspacing="0" class="" style="width:600px;" width="600"
            >
              <tr>
                <td style="line-height:0px;font-size:0px;mso-line-height-rule:exactly;">
            <![endif]-->

              <div style="background:#222228;background-color:#222228;Margin:0px auto;max-width:600px;">
                <table
                  align="center"
                  border="0"
                  cellpadding="0"
                  cellspacing="0"
                  role="presentation"
                  style="background:#222228;background-color:#222228;width:100%;"
                >
                  <tbody>
                    <tr>
                      <td style="direction:ltr;font-size:0px;padding:20px 0;text-align:center;vertical-align:top;">
                        <!--[if mso | IE]>
                        <table role="presentation" border="0" cellpadding="0" cellspacing="0">

              <tr>

                  <td
                     class="" style="vertical-align:top;width:480px;"
                  >
                <![endif]-->

                        <div
                          class="mj-column-per-80 outlook-group-fix"
                          style="font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;"
                        >
                          <table
                            border="0"
                            cellpadding="0"
                            cellspacing="0"
                            role="presentation"
                            style="vertical-align:top;"
                            width="100%"
                          >
                            <tr>
                              <td
                                align="center"
                                style="font-size:0px;padding:10px 25px;padding-top:30px;word-break:break-word;"
                              >
                                <table
                                  border="0"
                                  cellpadding="0"
                                  cellspacing="0"
                                  role="presentation"
                                  style="border-collapse:collapse;border-spacing:0px;"
                                >
                                  <tbody>
                                    <tr>
                                      <td style="width:80px;">
                                        <img
                                          alt="Zero To Launch"
                                          height="auto"
                                          src="http://cdn.auth0.com/website/emails/product/top-verify.png"
                                          style="border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;"
                                          width="80"
                                        />
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </td>
                            </tr>

                            <tr>
                              <td align="center" style="font-size:0px;padding:0 20px 0 20px;word-break:break-word;">
                                <div
                                  style="font-family:'Avenir Next', Avenir, sans-serif;font-size:20px;line-height:60ps;text-align:center;color:white;"
                                >
                                  Verify your identity
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>

                        <!--[if mso | IE]>
                  </td>

              </tr>

                        </table>
                      <![endif]-->
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!--[if mso | IE]>
                </td>
              </tr>
            </table>

            <table
               align="center" border="0" cellpadding="0" cellspacing="0" class="" style="width:600px;" width="600"
            >
              <tr>
                <td style="line-height:0px;font-size:0px;mso-line-height-rule:exactly;">
            <![endif]-->

              <div style="background:white;background-color:white;Margin:0px auto;max-width:600px;">
                <table
                  align="center"
                  border="0"
                  cellpadding="0"
                  cellspacing="0"
                  role="presentation"
                  style="background:white;background-color:white;width:100%;"
                >
                  <tbody>
                    <tr>
                      <td style="direction:ltr;font-size:0px;padding:20px 0;text-align:center;vertical-align:top;">
                        <!--[if mso | IE]>
                        <table role="presentation" border="0" cellpadding="0" cellspacing="0">

              <tr>

                  <td
                     class="" style="vertical-align:top;width:600px;"
                  >
                <![endif]-->

                        <div
                          class="mj-column-per-100 outlook-group-fix"
                          style="font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;"
                        >
                          <table
                            border="0"
                            cellpadding="0"
                            cellspacing="0"
                            role="presentation"
                            style="vertical-align:top;"
                            width="100%"
                          >
                            <tr>
                              <td align="center" style="font-size:0px;padding:0 45px;word-break:break-word;">
                                <div
                                  style="font-family:'Avenir Next', Avenir, sans-serif;font-size:13px;line-height:30px;text-align:center;color:#222228;"
                                >
                                  Please use the following code to help verify your identity:
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>

                        <!--[if mso | IE]>
                  </td>

              </tr>

                        </table>
                      <![endif]-->
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!--[if mso | IE]>
                </td>
              </tr>
            </table>

            <table
               align="center" border="0" cellpadding="0" cellspacing="0" class="" style="width:600px;" width="600"
            >
              <tr>
                <td style="line-height:0px;font-size:0px;mso-line-height-rule:exactly;">
            <![endif]-->

              <div style="background:white;background-color:white;Margin:0px auto;max-width:600px;">
                <table
                  align="center"
                  border="0"
                  cellpadding="0"
                  cellspacing="0"
                  role="presentation"
                  style="background:white;background-color:white;width:100%;"
                >
                  <tbody>
                    <tr>
                      <td style="direction:ltr;font-size:0px;padding:0 25px 40px;text-align:center;vertical-align:top;">
                        <!--[if mso | IE]>
                        <table role="presentation" border="0" cellpadding="0" cellspacing="0">

              <tr>

                  <td
                     class="" style="vertical-align:top;width:550px;"
                  >
                <![endif]-->

                        <div
                          class="mj-column-per-100 outlook-group-fix"
                          style="font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;"
                        >
                          <table
                            border="0"
                            cellpadding="0"
                            cellspacing="0"
                            role="presentation"
                            style="vertical-align:top;"
                            width="100%"
                          >
                            <tr>
                              <td align="center" style="font-size:0px;padding:0px;word-break:break-word;">
                                <div
                                  style="font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;text-align:center;color:#222228;"
                                >
                                  Your code is: <strong style="font-weight: 500; white-space: nowrap;">{{ code }}</strong>
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>

                        <!--[if mso | IE]>
                  </td>

              </tr>

                        </table>
                      <![endif]-->
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!--[if mso | IE]>
                </td>
              </tr>
            </table>

            <table
               align="center" border="0" cellpadding="0" cellspacing="0" class="" style="width:600px;" width="600"
            >
              <tr>
                <td style="line-height:0px;font-size:0px;mso-line-height-rule:exactly;">
            <![endif]-->

              <div style="background:#F5F7F9;background-color:#F5F7F9;Margin:0px auto;max-width:600px;">
                <table
                  align="center"
                  border="0"
                  cellpadding="0"
                  cellspacing="0"
                  role="presentation"
                  style="background:#F5F7F9;background-color:#F5F7F9;width:100%;"
                >
                  <tbody>
                    <tr>
                      <td style="direction:ltr;font-size:0px;padding:20px 0;text-align:center;vertical-align:top;">
                        <!--[if mso | IE]>
                        <table role="presentation" border="0" cellpadding="0" cellspacing="0">

              <tr>

                  <td
                     class="" style="vertical-align:top;width:600px;"
                  >
                <![endif]-->

                        <div
                          class="mj-column-per-100 outlook-group-fix"
                          style="font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;"
                        >
                          <table
                            border="0"
                            cellpadding="0"
                            cellspacing="0"
                            role="presentation"
                            style="vertical-align:top;"
                            width="100%"
                          >
                            <tr>
                              <td align="center" style="font-size:0px;padding:0 20px 0 20px;word-break:break-word;">
                                <div
                                  style="font-family:'Avenir Next', Avenir, sans-serif;font-size:13px;line-height:20px;text-align:center;color:#222228;"
                                >
                                  You’re receiving this email because you have an account in {{ friendly_name }}. If you are
                                  not sure why you’re receiving this, please contact us{% if support_url %} through our
                                  <a href="{{ support_url | escape }}" style="color:#0a84ae;text-decoration:none"
                                    >Support Center</a
                                  >{% endif %}.
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>

                        <!--[if mso | IE]>
                  </td>

              </tr>

                        </table>
                      <![endif]-->
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!--[if mso | IE]>
                </td>
              </tr>
            </table>
            <![endif]-->
            </div>
          </body>
        </html>
    EOT
  enabled                   = true
  from                      = "{{ application.name }} <support@nextgen.com>"
  include_email_in_redirect = false
  subject                   = ""
  syntax                    = "liquid"
  template                  = "verify_email_by_code"
  url_lifetime_in_seconds   = 0
}

resource "auth0_email_template" "reset_email" {
  depends_on                = [auth0_email.smtp_email_provider]
  body                      = <<-EOT
        <html>
        <head>
          <style type="text/css">
            .ExternalClass,.ExternalClass div,.ExternalClass font,.ExternalClass p,.ExternalClass span,.ExternalClass td,img {line-height: 100%;}#outlook a {padding: 0;}.ExternalClass,.ReadMsgBody {width: 100%;}a,blockquote,body,li,p,table,td {-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;}table,td {mso-table-lspace: 0;mso-table-rspace: 0;}img {-ms-interpolation-mode: bicubic;border: 0;height: auto;outline: 0;text-decoration: none;}table {border-collapse: collapse !important;}#bodyCell,#bodyTable,body {height: 100% !important;margin: 0;padding: 0;font-family: ProximaNova, sans-serif;}#bodyCell {padding: 20px;}#bodyTable {width: 600px;}@font-face {font-family: ProximaNova;src: url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-regular-webfont-webfont.eot);src: url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-regular-webfont-webfont.eot?#iefix)format("embedded-opentype"),url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-regular-webfont-webfont.woff) format("woff");font-weight: 400;font-style: normal;}@font-face {font-family: ProximaNova;src: url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-semibold-webfont-webfont.eot);src: url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-semibold-webfont-webfont.eot?#iefix)format("embedded-opentype"),url(https://cdn.auth0.com/fonts/proxima-nova/proximanova-semibold-webfont-webfont.woff) format("woff");font-weight: 600;font-style: normal;}@media only screen and (max-width: 480px) {#bodyTable,body {width: 100% !important;}a,blockquote,body,li,p,table,td {-webkit-text-size-adjust: none !important;}body {min-width: 100% !important;}#bodyTable {max-width: 600px !important;}#signIn {max-width: 280px !important;}}
          </style>
        </head>
        <body>
        <center>
          <table
            style='width: 600px;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;font-family: "ProximaNova", sans-serif;border-collapse: collapse !important;height: 100% !important;'
            align="center"
            border="0"
            cellpadding="0"
            cellspacing="0"
            height="100%"
            width="100%"
            id="bodyTable"
          >
            <tr>
              <td
                align="left"
                valign="top"
                id="bodyCell"
                style='-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 20px;font-family: "ProximaNova", sans-serif;height: 100% !important;'
              >
                <div class="main">
                  <p
                    style="text-align: center;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%; margin-bottom: 30px;"
                  >
                    <img
                      src="${var.logo_url}"
                      width="50"
                      alt="NextGen Logo"
                      style="-ms-interpolation-mode: bicubic;border: 0;height: auto;line-height: 100%;outline: none;text-decoration: none;"
                    />
                  </p>

                  <h2 style="text-align: center">Password Reset</h2>
                  <p>Hi,</p>
                  <p>We received a request to reset your NextGen password.</p>
                  <p>To reset your password, click the link below:</p>
                  <p>
                    <a href="{{ url }}" style="color: #FE6940"> {{ url }}</a>
                  </p>
                  <p style="font-size: 12px;">Having trouble? Just copy and paste this link into your browser.</p>
                  <p style="line-height: 1.5;">
                    If you did not request a new password, please contact our Customer Support via phone at 1-500-830 or email
                    <a href="mailto:support@nextgen.com" style="color: #FE6940">support@nextgen.com</a>
                    for any help.
                  </p>
                  <p>Yours sincerely,<br/>
                    NextGen
                  </p>
                </div>
              </td>
            </tr>
          </table>
        </center>
        </body>
        </html>
    EOT
  enabled                   = true
  from                      = "{{ application.name }} <support@nextgen.com>"
  include_email_in_redirect = false
  subject                   = "Password Reset"
  syntax                    = "liquid"
  template                  = "reset_email"
  url_lifetime_in_seconds   = 432000
}