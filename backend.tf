terraform {
  backend "s3" {
    bucket     = "terraform-state-backup-iti"
    key        = "terraform.tfstate"
  }
}
