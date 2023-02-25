resource "auth0_tenant" "nextgen_tenant" {
  allowed_logout_urls = []
  default_directory   = "Username-Password-Authentication"
  enabled_locales     = [
    "en",
  ]
  friendly_name = "NextGen App Tenant"
  picture_url   = var.logo_url

  flags {
    allow_legacy_delegation_grant_types    = false
    allow_legacy_ro_grant_types            = false
    allow_legacy_tokeninfo_endpoint        = false
    dashboard_insights_view                = false
    dashboard_log_streams_next             = false
    disable_clickjack_protection_headers   = false
    disable_fields_map_fix                 = false
    disable_management_api_sms_obfuscation = false
    enable_adfs_waad_email_verification    = false
    enable_apis_section                    = false
    enable_client_connections              = false
    enable_custom_domain_in_emails         = false
    enable_dynamic_client_registration     = false
    enable_idtoken_api2                    = false
    enable_legacy_logs_search_v2           = false
    enable_legacy_profile                  = false
    enable_pipeline2                       = false
    enable_public_signup_user_exists_error = false
    no_disclose_enterprise_connections     = false
    revoke_refresh_token_grant             = false
    universal_login                        = true
    use_scope_descriptions_for_consent     = false
  }

  session_cookie {}
}