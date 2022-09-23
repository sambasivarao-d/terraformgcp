terraform {
 backend "gcs" {
   bucket  = "santhoshstate"
   prefix  = "terraform/state6"
   credentials = "keys.json"
 }
}