provider "heroku" {
  version = "= 1.7.1"
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "web" {
  name   = "futureys-django2-${terraform.workspace}"
  region = "us"
  stack = "heroku-18"
  buildpacks = [
    "heroku/python"
  ]
  config_vars = {
    DJANGO_BASIC_AUTH_ID = "${var.django_basic_auth_id}"
    DJANGO_BASIC_AUTH_PW = "${var.django_basic_auth_pw}"
    DJANGO_SECRET = "${var.django_secret}"
    DJANGO_DEBUG = "${var.django_debug}"
  }
}

resource "heroku_addon" "database" {
  app  = "${heroku_app.web.name}"
  plan = "heroku-postgresql:hobby-dev"
}
