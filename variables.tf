variable "KC_URL" {
  description = "Die URL der Keycloak Instanz"
  type        = string
  default     = "http://localhost:8080"
}

variable "KC_ADMIN_USERNAME" {
  description = "Admin Benutzername"
  type        = string
  sensitive   = true # Verhindert, dass der Wert im Terminal ausgegeben wird
}

variable "KC_ADMIN_PW" {
  description = "Admin Passwort"
  type        = string
  sensitive   = true
}
variable "KC_REALM_ALL_CL_ALL_REDIR" {
  description = "Die Redirect_URI"
  type        = string
  default     = "http://"
}
variable "KC_AUDIENCE_1" {
  description = "aud claim"
  type        = string
  default     = "client_id oder name"
}
variable "KC_REALM_1" {
  description = "realm_name"
  type        = string
  default     = "realm name"
}
variable "KC_CLIENT_1" {
  description = "client"
  type        = string
  default     = "client_id"
}

locals {
  KC_USER_1 = "${var.KC_REALM_1}_user1"
  KC_USER_2 = "${var.KC_REALM_1}_user2"
  KC_USER_3 = "${var.KC_REALM_1}_user3"
  KC_USER_4 = "${var.KC_REALM_1}_user4"
  KC_PW_1 = "${var.KC_REALM_1}test123"

}




