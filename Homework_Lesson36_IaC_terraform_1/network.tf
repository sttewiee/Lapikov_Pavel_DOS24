resource "random_pet" "vpc_name" {
  length = 2
}

resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network-${random_pet.vpc_name.id}"
  auto_create_subnetworks = false
}

resource "random_pet" "subnet_name" {
  length = 2
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-${random_pet.subnet_name.id}"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "random_pet" "fw_name" {
  length = 2
}

resource "google_compute_firewall" "allow_web_ssh" {
  name    = "allow-web-ssh-${random_pet.fw_name.id}"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
}
