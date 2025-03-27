provider "google" {
  credentials = file("/home/alextmslearn/bucket/ordinal-stone-450713-n3-f9ed94f69b8d.json")
  project     = "ordinal-stone-450713-n3"
  region      = "europe-north1"
}

resource "random_id" "example_disk_id" {
  byte_length = 8
}

resource "google_compute_instance_template" "example_instance_template" {
  name_prefix  = "example-instance-template-"
  machine_type = "e2-medium"

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
}

resource "google_compute_instance_group_manager" "example_instance_group_manager" {
  name = "example-instance-group-manager"
  base_instance_name = "example-instance"
  zone = "europe-north1-a"
  version {
    instance_template = google_compute_instance_template.example_instance_template.self_link
  }

  target_size = 1
}

resource "google_compute_autoscaler" "example_autoscaler" {
  name   = "example-autoscaler"
  zone   = "europe-north1-a"
  target = google_compute_instance_group_manager.example_instance_group_manager.id

  autoscaling_policy {
    max_replicas = 3
    min_replicas = 1
    cpu_utilization {
      target = 0.6
    }
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
    group = google_compute_instance_group_manager.example_instance_group_manager.instance_group
  }
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
