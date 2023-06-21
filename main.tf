terraform {

  required_version = "= 1.4.6"



  required_providers {

    yandex = {

      source = "yandex-cloud/yandex"

      version = "= 0.73"

    }

  }
}


 variable "token" {
  type        = string
  sensitive   = true
}

provider "yandex" {
  
  token = var.token
  
  cloud_id = "b1g4vg6ffpqfmmu72eii"

  folder_id = "b1gppd4nkf0vv6ldlbod"

  zone = "ru-central1-a"

}


resource "yandex_compute_instance" "vm-debian1" {

  name = "terraform-debian1"

  allow_stopping_for_update = true

  resources {

    cores = 4

    memory = 4

  }

  boot_disk {

    initialize_params {

      image_id = "fd836i84upn7i2rsjvu2"

    }

  }

  network_interface {

    subnet_id = yandex_vpc_subnet.subnet_terraform.id

    nat = true

  }

  metadata = {

    user-data = "${file("./meta.yml")}"

  }
}
resource "yandex_compute_instance" "vm-debian2" {

  name = "terraform-debian2"

  allow_stopping_for_update = true

  resources {

    cores = 4

    memory = 4

  }

  boot_disk {

    initialize_params {

      image_id = "fd836i84upn7i2rsjvu2"

    }

  }

  network_interface {

    subnet_id = yandex_vpc_subnet.subnet_terraform.id

    nat = true

  }

  metadata = {

    user-data = "${file("./meta.yml")}"

  }

}

resource "yandex_compute_instance" "vm-debian3" {

  name = "terraform-debian3"

  allow_stopping_for_update = true

  resources {

    cores = 4

    memory = 4

  }

  boot_disk {

    initialize_params {

      image_id = "fd836i84upn7i2rsjvu2"

    }

  }

  network_interface {

    subnet_id = yandex_vpc_subnet.subnet_terraform.id

    nat = true

  }

  metadata = {

    user-data = "${file("./meta.yml")}"

  }

}

resource "yandex_compute_instance" "vm-ubuntu4" {

  name = "terraform-ubuntu4"

  allow_stopping_for_update = true

  resources {

    cores = 4

    memory = 4

  }

  boot_disk {

    initialize_params {

      image_id = "fd8fq554fdj104vdf8ka"

    }

  }

  network_interface {

    subnet_id = yandex_vpc_subnet.subnet_terraform.id

    nat = true

  }

  metadata = {

    user-data = "${file("./meta.yml")}"

  }

}

resource "yandex_compute_instance" "vm-centos5" {

  name = "terraform-centos5"

  allow_stopping_for_update = true

  resources {

    cores = 4

    memory = 4

  }

  boot_disk {

    initialize_params {

      image_id = "fd8f5l3798bmqndsmvem"

    }

  }

  network_interface {

    subnet_id = yandex_vpc_subnet.subnet_terraform.id

    nat = true

  }

  metadata = {

    user-data = "${file("./meta.yml")}"

  }

}

resource "yandex_vpc_network" "network_terraform" {

  name = "network_terraform"

}

resource "yandex_vpc_subnet" "subnet_terraform" {

  name = "subnet_terraform"

  zone = "ru-central1-a"

  network_id = yandex_vpc_network.network_terraform.id

  v4_cidr_blocks = ["192.168.15.0/24"]
}

