terraform {
 backend "gcs" {
   bucket  = "santhupracticebuck"
   prefix  = "terraform/state"
 }
}