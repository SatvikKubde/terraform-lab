terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Module 1
module "container1" {
  source = "./modules/nginx_container"

  container_name = "nginx1"
  container_port = 8081
  image_name     = docker_image.nginx.image_id
}

# Module 2
module "container2" {
  source = "./modules/nginx_container"

  container_name = "nginx2"
  container_port = 8082
  image_name     = docker_image.nginx.image_id
}
