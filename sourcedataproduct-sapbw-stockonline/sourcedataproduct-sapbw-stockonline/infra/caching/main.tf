// Create a new storage bucket.
resource "google_storage_bucket" "archivalbucket" {
  name     = var.archivalbucket
  location = var.location
  storage_class = var.storage_class
  force_destroy = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "bucket" {
  name     = var.landingbucket
  location = var.location
  uniform_bucket_level_access = true
}

resource "google_pubsub_topic" "topics" {
    name = var.topic_name
}

resource "google_pubsub_subscription" "subscription" {
  name  = var.subscription_name
  topic = google_pubsub_topic.topics.name

}

resource "google_storage_notification" "notification" {
  bucket         = google_storage_bucket.bucket.name
  payload_format = "JSON_API_V1"
  topic          = google_pubsub_topic.topics.id
  depends_on = [google_pubsub_topic_iam_binding.binding]
}

// Enable notifications by giving the correct IAM permission to the unique service account.
data "google_storage_project_service_account" "gcs_account" {
}

// Create a Pub/Sub topic.
resource "google_pubsub_topic_iam_binding" "binding" {
  topic    = google_pubsub_topic.topics.id
  role     = "roles/pubsub.publisher"
  members  = ["serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"]
}