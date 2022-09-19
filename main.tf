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

resource "google_bigquery_dataset" "dataset" {
    dataset_id = "mydata1"
  
}

resource "google_bigquery_table" "table" {
    table_id = "testtable"
    dataset_id = google_bigquery_dataset.dataset.dataset_id
    schema =  "${file("query.json")}"
    }