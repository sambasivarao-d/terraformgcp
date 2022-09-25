

module "ServiceAccount" {
    source = "../infra/ops_resources"
    serviceaccount = var.serviceaccount
    display_name = var.display_name
    role1 = var.role1
    role2 = var.role2
    project = var.project
  
}

module "pubsubnotification-with-GCS" {
    source = "../infra/caching"
    landingbucket     = var.landingbucket
    storage_class = var.storage_class
    archivalbucket = var.archivalbucket
    location = var.location
    topic_name = var.topic_name
    subscription_name   = var.subscription_name

}

module "Bigquery" {
    source = "../infra/data_product"
    region = var.region
    project = var.project
    datasetID = var.datasetID
    table = var.table
    zone = var.zone

}


