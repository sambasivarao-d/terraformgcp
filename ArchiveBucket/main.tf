resource "google_storage_bucket" "bucket" {
  name     = var.bucket
  location = var.location
  storage_class = var.storage_class
  force_destroy = true
  uniform_bucket_level_access = true
}
