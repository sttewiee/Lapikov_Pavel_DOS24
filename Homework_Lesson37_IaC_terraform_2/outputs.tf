output "bucket_name" {
  value = module.app_bucket.name
}

output "bucket_url" {
  value = module.app_bucket.url
}

output "db_connection_name" {
  value = google_sql_database_instance.db.connection_name
}
