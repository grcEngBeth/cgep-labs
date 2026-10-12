terraform {
  required_version = ">= 1.6"
  required_providers {
    google = { source = "hashicorp/google", version = "~> 5.0" }
  }
}

provider "google" {
  project = var.gcp_project
  region  = "us-central1"

  # Bill/quota API calls to our own project (needed for the Org Policy API)
  user_project_override = true
  billing_project       = var.gcp_project
}
