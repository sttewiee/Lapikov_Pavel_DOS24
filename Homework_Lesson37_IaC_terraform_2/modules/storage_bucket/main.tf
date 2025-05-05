resource "google_storage_bucket" "bucket" {
  name          = var.name
  location      = var.location
  storage_class = var.storage_class
  force_destroy = true
}

resource "google_storage_bucket_object" "initial" {
  for_each = toset(var.initial_files)

  name   = basename(each.value)
  bucket = google_storage_bucket.bucket.name
  source = each.value
}
