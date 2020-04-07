provider "aws" {
  version    = "~> 2.0"
  region     = "eu-west-1"
  access_key = "${var.AWS_ACCESS_KEY_ID}"
  secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
}
