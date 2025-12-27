terraform {
  required_providers {
    keycloak = {
      source = "keycloak/keycloak"
      version = "5.6.0"
    }
  }
}

provider "keycloak" {
    client_id     = "admin-cli"
    username      = var.KC_ADMIN_USERNAME
    password      = var.KC_ADMIN_PW
    url           = var.KC_URL
    realm         = "master"
}


