provider "google" {
  credentials = file("/home/alextmslearn/bucket/ordinal-stone-450713-n3-f9ed94f69b8d.json")
  project     = "ordinal-stone-450713-n3"
  region      = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name     = "mylapikovterrabucket"
  location = "US"
}

