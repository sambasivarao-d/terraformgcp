resource "google_service_account" "account1" {
  account_id   = var.serviceaccount1
  display_name = var.display_name1
}
resource "google_service_account" "account2" {
  account_id   = var.serviceaccount2
  display_name = var.display_name2
}
resource "google_service_account" "account3" {
  account_id   = var.serviceaccount3
  display_name = var.display_name3
}
resource "google_service_account" "account4" {
  account_id   = var.serviceaccount4
  display_name = var.display_name4
}
resource "google_service_account" "account5" {
  account_id   = var.serviceaccount5
  display_name = var.display_name5
}
resource "google_service_account" "account6" {
  account_id   = var.serviceaccount6
  display_name = var.display_name6
}
resource "google_service_account" "account7" {
  account_id   = var.serviceaccount7
  display_name = var.display_name7
}
resource "google_service_account" "account8" {
  account_id   = var.serviceaccount8
  display_name = var.display_name8
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
    "serviceAccount:${google_service_account.account1.email}",
    "serviceAccount:${google_service_account.account2.email}",
    "serviceAccount:${google_service_account.account3.email}",
    "serviceAccount:${google_service_account.account4.email}",
    "serviceAccount:${google_service_account.account5.email}",
    "serviceAccount:${google_service_account.account6.email}",
    "serviceAccount:${google_service_account.account7.email}",
    "serviceAccount:${google_service_account.account8.email}"

  ]
}