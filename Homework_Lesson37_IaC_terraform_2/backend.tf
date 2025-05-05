terraform {
  backend "gcs" {
    bucket = "terraform-state-your-id"
    prefix = "global/terraform.tfstate"
  }
}
