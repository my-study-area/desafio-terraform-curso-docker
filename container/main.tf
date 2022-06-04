resource "docker_container" "mongo" {
  name = "mongodb"
  image = var.images_stored.mongo.image_type

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

resource "docker_container" "app_stack" {
  count = var.apps_counter
  name = var.names_stored[count.index]
  image = var.images_stored.app.image_type

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

resource "docker_network" "private_network" {
  name = var.network_stored
}

resource "docker_container" "nginx" {
  name = "nginx"
  image = var.images_stored.nginx.image_type

  ports {
    internal = var.internal_stored
    external = var.external_stored
  }
  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}
