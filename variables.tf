variable "image" {
  type = map(any)
  default = {
    "mongo" = "mongo"
    "app"   = "adrianoavelino/alura-books:0.2"
    "nginx" = "adrianoavelino/nginx-curso-alura-docker:0.1"
  }
}
variable "network_name" {
  type = string
  default = "my_network"
}
variable "port" {
  type = map(number)
  default = {
    internal = 80
    external = 80
  }
}
