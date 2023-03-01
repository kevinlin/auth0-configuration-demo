resource "auth0_action" "post_login" {
  code    = <<-EOT
        /**
        * Handler that will be called during the execution of a PostLogin flow.
        *
        * @param {Event} event - Details about the user and the context in which they are logging in.
        * @param {PostLoginAPI} api - Interface whose methods can be used to change the behavior of the login.
        */
        exports.onExecutePostLogin = async (event, api) => {
          const namespace = 'https://nextgen.com';
          const { language, nextgen_user_id } = event.user.user_metadata;
          const nickname = event.user.nickname;

          if (event.authorization) {
            api.idToken.setCustomClaim(`language`, language);
            api.idToken.setCustomClaim(`nextgen_user_id`, nextgen_user_id);
            if (nickname) {
              api.idToken.setCustomClaim(`user_name`, nickname);
              api.idToken.setCustomClaim(`given_name`, nickname.split('.')[0]);
              api.idToken.setCustomClaim(`family_name`, nickname.split('.')[1]);
            }

            api.accessToken.setCustomClaim(`$${namespace}/language`, language);
            api.accessToken.setCustomClaim(`$${namespace}/nextgen_user_id`, nextgen_user_id);
            api.accessToken.setCustomClaim(`$${namespace}/user_name`, nickname);
            api.accessToken.setCustomClaim(`$${namespace}/roles`, event.authorization.roles);
          }
        };
    EOT
  deploy  = true
  name    = "Post Login"
  runtime = "node16"

  supported_triggers {
    id      = "post-login"
    version = "v3"
  }
}

resource "auth0_trigger_binding" "post_login" {
  depends_on = [auth0_action.post_login]
  trigger    = "post-login"

  actions {
    display_name = auth0_action.post_login.name
    id           = auth0_action.post_login.id
  }
}