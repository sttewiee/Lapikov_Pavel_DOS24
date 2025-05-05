resource "google_compute_instance" "ubuntu_ce" {
  name         = var.instance_name
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
    }
  }

  metadata = {
    startup-script = file("${path.module}/user-data.sh")
    ssh-keys       = "ubuntu:${file("${path.module}/${var.ssh_public_key_path}")}"
  }

  tags = ["web", "ssh"]

  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link
    access_config {}
  }
}
