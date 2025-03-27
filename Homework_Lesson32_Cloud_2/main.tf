# provider "google" для настройки Terraform для работы с GCP
provider "google" {
  credentials = file("/home/alextmslearn/bucket/ordinal-stone-450713-n3-f9ed94f69b8d.json")  # Указан путь к файлу с ключом
  project     = "ordinal-stone-450713-n3"  # Указан ID проекта
  region      = "europe-north1"            # Указан регион Финляндии
}

# Ресурс для создания VM (виртуальной машины)
resource "google_compute_instance" "example_vm" {
  name         = "example-instance"
  machine_type = "e2-medium"            # Тип машины
  zone         = "europe-north1-a"      # Зона для размещения VM в регионе Финляндия
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"  # Образ Ubuntu 20.04
    }
  }
  
  # Сетевое подключение (по умолчанию)
  network_interface {
    network = "default"
    access_config {}  # Для публичного IP
  }

  # Добавляем публичный SSH-ключ для доступа с пользователем alextmslearn
  metadata = {
    ssh-keys = "alextmslearn:${file("/home/alextmslearn/.ssh/google_compute_engine.pub")}"
  }

  # Привязка Persistent Disk к виртуальной машине
  attached_disk {
    source = google_compute_disk.example_disk.id  # Привязываем диск
    mode   = "READ_WRITE"                         # Режим работы с диском
  }
}

# Ресурс для создания Persistent Disk (SSD)
resource "google_compute_disk" "example_disk" {
  name  = "example-disk"     # Имя диска
  size  = 10                  # Размер диска (в гигабайтах)
  type  = "pd-ssd"            # Тип диска (Persistent SSD)
  zone  = "europe-north1-a"   # Зона, в которой будет расположен диск
}
