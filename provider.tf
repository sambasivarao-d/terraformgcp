terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.36.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-practice2"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "keys.json"
}
