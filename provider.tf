terraform {
  required_version = ">=1.0.0"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
  }
}

# Provider
provider "google" {    
  project = var.project_id
}
provider "google-beta" { 
  project = var.project_id
}
