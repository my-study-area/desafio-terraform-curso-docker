resource "docker_image" "nginx-curso-alura-docker" {
  name = var.image.nginx
}

resource "docker_image" "alura-books" {
  name = var.image.app
}

resource "docker_image" "mongo" {
  name = var.image.mongo
}

resource "docker_network" "private_network" {
  name = var.network_name
}

resource "docker_container" "mongo" {
  name  = "mongodb"
  image = docker_image.mongo.latest
  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

resource "docker_container" "node1" {
  name = "node1"
  image = docker_image.alura-books.latest

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

resource "docker_container" "node2" {
  name = "node2"
  image = docker_image.alura-books.latest

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

resource "docker_container" "node3" {
  name = "node3"
  image = docker_image.alura-books.latest

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

resource "docker_container" "nginx" {
  name = "nginx"
  image = docker_image.nginx-curso-alura-docker.latest

  ports {
    internal = var.port.internal
    external = var.port.external
  }
  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

