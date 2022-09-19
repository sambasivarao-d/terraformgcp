terraform {
 backend "gcs" {
   bucket  = "santhoshstate"
   prefix  = "terraform/state"
 }
}