module "image" {
  for_each = local.image_type
  source = "./image"
  image_stored = each.value.image
}

module "container" {
  apps_counter = local.container_count
  for_each = var.stack_container.app
  source = "./container"
  names_stored = each.value
  images_stored = module.image
  network_stored = var.network_name
  internal_stored = var.port.internal
  external_stored = var.port.external
}
