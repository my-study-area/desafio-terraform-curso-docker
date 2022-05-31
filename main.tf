terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx-curso-alura-docker" {
  name = "adrianoavelino/nginx-curso-alura-docker:latest"
}

resource "docker_image" "alura-books" {
  name = "adrianoavelino/alura-books:latest"
}

resource "docker_image" "mongo" {
  name = "mongo"
}
