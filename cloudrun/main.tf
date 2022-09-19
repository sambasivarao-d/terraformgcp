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
}


resource "google_cloud_run_service" "test" {
  name = "cloud-run1"
    location = "asia-southeast1"
    #project = "terraform-practice2"
    template {
      spec {
        containers {
          image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
      }
      }



      }
