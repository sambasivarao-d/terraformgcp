resource "google_service_account" "serviceAccount" {
  account_id   = var.serviceaccount
  display_name = var.display_name
}

resource "google_project_iam_binding" "roles" {
  project = var.project
  for_each = toset ([
    var.role1,
    var.role2
    #"roles/storage.legacyBucketReader",
    #"roles/storage.legacyBucketWriter",
    #"roles/storage.legacyObjectReader",
  ])
  
  role = each.key
  
  members = [
    "serviceAccount:${google_service_account.serviceAccount.email}"

  ]
}