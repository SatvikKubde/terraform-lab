terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Force correct Docker connection
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create container
resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }
}

# Output
output "container_url" {
  value = "http://localhost:8080"
}
