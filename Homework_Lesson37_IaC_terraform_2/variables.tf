variable "project_id" {
  type    = string
  default = "turnkey-realm-450613-c7"
}

variable "region" {
  type    = string
  default = "europe-north1"
}

variable "zone" {
  type    = string
  default = "europe-north1-b"
}

variable "bucket_name" {
  type    = string
  default = "my-unique-app-bucket-1234" 
}

variable "bucket_location" {
  type    = string
  default = "europe-north1"
}

variable "bucket_storage_class" {
  type    = string
  default = "STANDARD"
}

variable "initial_files" {
  type    = list(string)
  default = ["welcome.txt"]
}
