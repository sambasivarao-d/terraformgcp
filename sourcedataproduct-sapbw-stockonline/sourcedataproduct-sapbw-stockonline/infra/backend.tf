terraform {
 backend "gcs" {
   bucket  = "santhoshstate"
   prefix  = "terraform/state8"
   credentials = "keys.json"
 }
}