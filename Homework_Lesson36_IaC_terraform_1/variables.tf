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

variable "instance_name" {
  type    = string
  default = "ubuntu24-ce"
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "ssh_public_key_path" {
  type    = string
  default = "key.pub"
}
