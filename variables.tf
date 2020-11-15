variable "heroku_email" {}
variable "heroku_api_key" {}
variable "django_secret" {}
variable "django_debug" {
  default = "false"
}
variable "django_basic_auth_id" {
  default = ""
}
variable "django_basic_auth_pw" {
  default = ""
}
