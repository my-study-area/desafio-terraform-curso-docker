module "image" {
  for_each = local.image_type
  source = "./image"
  image_stored = each.value.image
}

resource "docker_network" "private_network" {
  name = var.network_name
}

resource "docker_container" "mongo" {
  name  = "mongodb"
  image = module.image.mongo.image_type
  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

resource "docker_container" "node1" {
  name = "node1"
  image = module.image.app.image_type

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

resource "docker_container" "node2" {
  name = "node2"
  image = module.image.app.image_type

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

resource "docker_container" "node3" {
  name = "node3"
  image = module.image.app.image_type

  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

resource "docker_container" "nginx" {
  name = "nginx"
  image = module.image.nginx.image_type

  ports {
    internal = var.port.internal
    external = var.port.external
  }
  networks_advanced {
    name = "${docker_network.private_network.name}"
  }
}

