#########################################
resource "keycloak_realm" "REALM_1" {
  realm   = var.KC_REALM_1 
  enabled = true
}
##########################################
# Client_1 Realm 1
  resource "keycloak_openid_client" "CLIENT_1" {
  realm_id              = keycloak_realm.REALM_1.id
  client_id             = var.KC_CLIENT_1
  
  access_type           = "CONFIDENTIAL"
  standard_flow_enabled = true
  valid_redirect_uris   = [var.KC_REALM_ALL_CL_ALL_REDIR]
  web_origins           = ["+"]
}

##########################test-client-scope########
  
#resource "keycloak_openid_client_scope" "client_scope" {
#  realm_id = keycloak_realm.REALM_1.id
#  name     = "test-client-scope"
#}

#######################################


resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_realm.REALM_1.id
  client_id = keycloak_openid_client.CLIENT_1.id


  default_scopes = [
    "profile",
    #"email",
    #"web-origins",
    #keycloak_openid_client_scope.client_scope.name,
  ]
}
#--------------------------------------------------------

resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = keycloak_realm.REALM_1.id
  client_id = keycloak_openid_client.CLIENT_1.id

  optional_scopes = [
    #"address",
    "email",
    #"microprofile-jwt",
    #keycloak_openid_client_scope.client_scope.name
  ]
}




#######################

  resource "keycloak_openid_audience_protocol_mapper" "aud_mapper" {
  realm_id                 = keycloak_realm.REALM_1.id
  client_id                = keycloak_openid_client.CLIENT_1.id
  name                     = "audience-mapper"
  
  # Audience Value
  #included_custom_audience = var.KC_AUDIENCE_1
  #included_custom_audience = keycloak_openid_client.CLIENT_1.client_id
  included_client_audience = keycloak_openid_client.CLIENT_1.client_id
# Token Schalter:
  add_to_id_token     = true
  add_to_access_token = true
}


###########################################################
  # User 1  Realm 1
  resource "keycloak_user" "USER1" {
  realm_id   = keycloak_realm.REALM_1.id
  username   = local.KC_USER_1
  first_name = "us"
  last_name  = "er"
  email      = "user1@labca.de"
  email_verified = true
  enabled    = true
  initial_password {
    value     = local.KC_PW_1
    temporary = false
  }
}
# User 2  Realm 1
  resource "keycloak_user" "USER2" {
  realm_id   = keycloak_realm.REALM_1.id
  username   = local.KC_USER_2
  first_name = "us"
  last_name  = "er"
  email      = "user2@labca.de"
  email_verified = true
  enabled    = true
  initial_password {
    value     = local.KC_PW_1
    temporary = false
  }
}
# User 3  Realm 1
  resource "keycloak_user" "USER3" {
  realm_id   = keycloak_realm.REALM_1.id
  username   = local.KC_USER_3
  first_name = "us"
  last_name  = "er"
  email      = "user3@labca.de"
  email_verified = true
  enabled    = true
  initial_password {
    value     = local.KC_PW_1
    temporary = false
  }
}
# User 4  Realm 1
  resource "keycloak_user" "USER4" {
  realm_id   = keycloak_realm.REALM_1.id
  username   = local.KC_USER_4
  first_name = "us"
  last_name  = "er"
  email      = "user4@labca.de"
  email_verified = true
  enabled    = true
  initial_password {
    value     = local.KC_PW_1
    temporary = false
  }
}
