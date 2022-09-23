

resource "google_bigquery_dataset" "dataset" {
    dataset_id = var.datasetID
    project = var.project
  
}

resource "google_bigquery_table" "table" {
    table_id = var.table
    dataset_id = google_bigquery_dataset.dataset.dataset_id
    schema =  "${file("schema_json_v1.json")}"

    }