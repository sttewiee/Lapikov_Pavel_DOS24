module "app_bucket" {
  source        = "./modules/storage_bucket"
  name          = var.bucket_name
  location      = var.bucket_location
  storage_class = var.bucket_storage_class
  initial_files = var.initial_files
}

resource "google_sql_database_instance" "db" {
  name             = "tf-cloudsql-db"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "appdb" {
  name     = "appdb"
  instance = google_sql_database_instance.db.name
}

resource "google_sql_user" "usersvc" {
  name     = "appuser"
  instance = google_sql_database_instance.db.name
  password = "ChangeMe123!"
}
