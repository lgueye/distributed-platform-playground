# droplets specs
variable "droplet_image" {
  default = "ubuntu-24-04-x64"
}

variable "droplet_size_1g" {
  default = "s-1vcpu-1gb"
}

variable "droplet_size_2g" {
  default = "s-2vcpu-2gb"
}
# target environment
resource "digitalocean_tag" "target_env" {
  name = var.target_env
}
