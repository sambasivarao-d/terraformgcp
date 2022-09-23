module "ServiceAccount" {
    source = ".//ServiceAccount"
    serviceaccount = var.serviceaccount
    display_name = var.display_name
    role1 = var.role1
    role2 = var.role2
    project = var.project
  
}

module "archivebucket" {
    source = ".//ArchiveBucket"
    bucket = var.bucket
    location = var.location
    storage_class  = var.storage_class
}

module "pubsubnotification-with-GCS" {
    source = ".//PubsubNotification-withGCS"
    landingbucket     = var.landingbucket
    location = var.location
    topic_name = var.topic_name
    subscription_name   = var.subscription_name

}

module "Bigquery" {
    source = ".//Bigquery"
    region = var.region
    project = var.project
    datasetID = var.datasetID
    table = var.table
    zone = var.zone

}


