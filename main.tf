resource "google_cloud_run_service" "test" {
  name = "cloud-run"
    location = "asia-southeast1"

    template {
      spec {
        containers {
            image = "us-docker.pkg.dev/cloudrun/container/hello"
        }
      }
    }
}