provider "google" {
  credentials = file("/home/alextmslearn/bucket/ordinal-stone-450713-n3-f9ed94f69b8d.json")
  project     = "ordinal-stone-450713-n3"
  region      = "europe-north1"
}


resource "random_id" "example_disk_id" {
  byte_length = 8
}


resource "google_compute_instance" "example_vm" {
  name         = "example-instance"
  machine_type = "e2-medium"
  zone         = "europe-north1-a"
  boot_disk {
    initialize_params {
      image = "projects/ordinal-stone-450713-n3/global/images/nginx"  # Используем ваш собранный образ
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "alextmslearn:${file("/home/alextmslearn/.ssh/google_compute_engine.pub")}"
  }

  attached_disk {
    source = google_compute_disk.example_disk.id
    mode   = "READ_WRITE"
  }
}


resource "google_compute_disk" "example_disk" {
  name  = "example-disk-${random_id.example_disk_id.hex}"
  size  = 10
  type  = "pd-ssd"
  zone  = "europe-north1-a"
}


resource "google_compute_health_check" "example_health_check" {
  name               = "example-health-check"
  http_health_check {
    port = 80
    request_path = "/"
  }
  check_interval_sec = 5
  timeout_sec        = 5
  unhealthy_threshold = 3
  healthy_threshold   = 3
}


resource "google_compute_backend_service" "example_backend_service" {
  name        = "example-backend-service"
  protocol    = "HTTP"
  port_name   = "http"
  health_checks = [google_compute_health_check.example_health_check.id]
  
  backend {
    group = google_compute_instance_group.example_instance_group.id
  }
}


resource "google_compute_instance_group" "example_instance_group" {
  name        = "example-instance-group"
  zone        = "europe-north1-a"
  instances   = [google_compute_instance.example_vm.id]
}


resource "google_compute_url_map" "example_url_map" {
  name            = "example-url-map"
  default_service = google_compute_backend_service.example_backend_service.id
}


resource "google_compute_target_http_proxy" "example_target_http_proxy" {
  name    = "example-target-http-proxy"
  url_map = google_compute_url_map.example_url_map.id
}

resource "google_compute_global_address" "example_ip" {
  name = "example-ip"
}

resource "google_compute_global_forwarding_rule" "example_forwarding_rule" {
  name        = "example-forwarding-rule"
  ip_address  = google_compute_global_address.example_ip.address
  target      = google_compute_target_http_proxy.example_target_http_proxy.id
  port_range  = "80"
}


resource "google_compute_firewall" "example_firewall" {
  name    = "allow-http"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
}

output "example-ip" {
  value       = google_compute_global_address.example_ip.address
  description = "The external IP address of the Load Balancer"
}
