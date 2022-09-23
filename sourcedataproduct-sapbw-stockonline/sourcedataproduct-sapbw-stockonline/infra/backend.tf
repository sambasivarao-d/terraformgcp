terraform {
 backend "gcs" {
   bucket  = "santhoshstate"
   prefix  = "terraform/state7"
   credentials = "keys.json"
 }
}