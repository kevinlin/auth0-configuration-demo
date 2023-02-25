resource "auth0_connection_client" "sms_conn_patient_app_assoc" {
  depends_on    = [auth0_connection.sms, auth0_client.mobile_app]
  connection_id = auth0_connection.sms.id
  client_id     = auth0_client.mobile_app.id
}