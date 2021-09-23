terraform {
  backend "gcs" {
    bucket = "lpgstb-tfo-netstate-s-uswe1-01"
    prefix = "terraform/state"
  }
}
