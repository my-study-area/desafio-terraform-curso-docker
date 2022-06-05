output "container_database" {
  value = join(":", [docker_container.mongo.name])
}

output "container_nginx" {
  value = join(":", [docker_container.nginx.name], docker_container.nginx.ports[*]["external"])
}

output "containers_app" {
  value = [for i in docker_container.app_stack[*]: join(":", [i.name])]
}
