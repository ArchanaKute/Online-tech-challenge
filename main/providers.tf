terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.50.0"
    }
  }
}

provider "google" {
  credentials = file("credentials.json")
}

provider "google-beta" {
  credentials = file("credentials.json")
}
