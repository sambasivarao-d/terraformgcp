resource "google_cloud_run_service" "test" {
  name = "cloud-run"
    location = "asia-southeast1"
    project = "terraform-practice2"
    region = "us-central1"
    zone = "us-central1-a"
    template {
      spec {
        containers {
          image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
      }
      }
    backend "gcs" {
      bucket  = "santhoshstate"
      prefix  = "terraform/state"
 }



      }
