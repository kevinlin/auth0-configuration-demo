resource "auth0_role" "content_admin" {
  name        = "CONTENT_ADMIN"
  description = "Content Admin"
}

resource "auth0_role" "marketing_admin" {
  name        = "MARKETING_ADMIN"
  description = "Marketing Admin"
}

resource "auth0_role" "platform_admin" {
  name        = "PLATFORM_ADMIN"
  description = "Platform Admin"
}

resource "auth0_role" "super_admin" {
  name        = "SUPER_ADMIN"
  description = "Super Admin"
}