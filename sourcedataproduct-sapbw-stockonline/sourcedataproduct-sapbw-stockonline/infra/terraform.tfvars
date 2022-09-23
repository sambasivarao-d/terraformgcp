
#archival bucket details

archivalbucket = "sap_bw-stockadjustmentsonline-archive"
location = "US"
storage_class = "STANDARD"

## Landing bucket $ pubsub topics details

landingbucket = "sap_bw-stockadjustmentsonline-landing"
topic_name = "SAP_BW-StockAdjustmentsOnline-FileEvent"
subscription_name = "SAP_BW-StockAdjustmentsOnline-Created"


# please provide datasetID & table name and other details for bigquery
datasetID = "SupplyChainSrcDataStockBalanceOnline"
table = "StockBalanceOnline"
zone = "us-central1-a"
region = "us-central1"
project = "terraform-practice2"


##service account id & display names
serviceaccount = "sap-bw-stockadjustmentsonline"
display_name = "ap-bw-stockadjustmentsonline-file-delivery"


##roles for service account

role1 = "roles/storage.objectCreator"
role2 = "roles/storage.objectViewer"