output "name" {
  value = google_storage_bucket.bucket.name
}

output "url" {
  value = "gs://${google_storage_bucket.bucket.name}"
}
