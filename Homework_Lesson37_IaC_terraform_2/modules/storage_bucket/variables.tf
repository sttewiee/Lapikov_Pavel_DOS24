variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_class" {
  type = string
}

variable "initial_files" {
  type    = list(string)
  default = []
}
