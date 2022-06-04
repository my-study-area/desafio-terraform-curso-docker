locals {
  image_type = {
    mongo = {
      image = var.image.mongo
    }

    app = {
      image = var.image.app
    }

    nginx = {
      image = var.image.nginx
    }
  }

  container_count = length(var.stack_container.app.names)
}
