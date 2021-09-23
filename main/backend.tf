terraform {
  backend "gcs" {
    bucket = "demo-bucket"
    prefix = "terraform/state"
  }
}
