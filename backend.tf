terraform {
  backend "s3" {
    bucket     = "terraform-state-backup-iti"
    key        = "terraform.tfstate"
    region     = "eu-west-1"
    access_key = "${var.AWS_ACCESS_KEY_ID}"
    secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
  }
}
