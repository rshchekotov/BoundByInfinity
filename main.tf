terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = var.docker_host
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name  = "bbi-nginx"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = "${abspath(path.root)}/web-router/nginx.conf"
    container_path = "/etc/nginx/nginx.conf"
    read_only      = true
  }
}
