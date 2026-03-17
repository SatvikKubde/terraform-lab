terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_container" "nginx" {
  name  = var.container_name
  image = var.image_name

  ports {
    internal = 80
    external = var.container_port
  }
}
