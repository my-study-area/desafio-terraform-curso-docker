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
}
