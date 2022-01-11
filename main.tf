terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      #In real environment version should be here
    }
  }
}

provider "google" {
  credentials = file("secret.json")
  project     = var.gcp_project_id
  region      = var.gcp_region
}
