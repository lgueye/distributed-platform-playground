# consul cluster vars
resource "digitalocean_tag" "discovery_server_role" {
  name = "discovery_${var.server_role}"
}
resource "digitalocean_droplet" "consul_server_01_droplet" {
  image = var.droplet_image
  name = "consul-${var.server_role}-01"
  region = var.datacenter_name
  size = var.droplet_size_1g
  ssh_keys = [
    var.ssh_fingerprint]
  tags = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.discovery_server_role.name,
    digitalocean_tag.leader_role.name,
  ]
}
resource "ansible_host" "consul_server_01_droplet" {
  inventory_hostname = digitalocean_droplet.consul_server_01_droplet.name
  groups = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.discovery_server_role.name,
    digitalocean_tag.leader_role.name,
  ]
  vars = {
    ansible_host = digitalocean_droplet.consul_server_01_droplet.ipv4_address
    ansible_python_interpreter = var.ansible_python_interpreter
    datacenter_name = var.datacenter_name
    cluster_role = var.leader_cluster_role
  }
}
resource "digitalocean_droplet" "consul_server_02_droplet" {
  image = var.droplet_image
  name = "consul-${var.server_role}-02"
  region = var.datacenter_name
  size = var.droplet_size_1g
  ssh_keys = [
    var.ssh_fingerprint]
  tags = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.discovery_server_role.name,
    digitalocean_tag.follower_role.name,
  ]
}
resource "ansible_host" "consul_server_02_droplet" {
  inventory_hostname = digitalocean_droplet.consul_server_02_droplet.name
  groups = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.discovery_server_role.name,
    digitalocean_tag.follower_role.name,
  ]
  vars = {
    ansible_host = digitalocean_droplet.consul_server_02_droplet.ipv4_address
    ansible_python_interpreter = var.ansible_python_interpreter
    datacenter_name = var.datacenter_name
    cluster_role = var.follower_cluster_role
  }
}
resource "digitalocean_droplet" "consul_server_03_droplet" {
  image = var.droplet_image
  name = "consul-${var.server_role}-03"
  region = var.datacenter_name
  size = var.droplet_size_1g
  ssh_keys = [
    var.ssh_fingerprint]
  tags = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.discovery_server_role.name,
    digitalocean_tag.follower_role.name,
  ]
}
resource "ansible_host" "consul_server_03_droplet" {
  inventory_hostname = digitalocean_droplet.consul_server_03_droplet.name
  groups = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.discovery_server_role.name,
    digitalocean_tag.follower_role.name,
  ]
  vars = {
    ansible_host = digitalocean_droplet.consul_server_03_droplet.ipv4_address
    ansible_python_interpreter = var.ansible_python_interpreter
    datacenter_name = var.datacenter_name
    cluster_role = var.follower_cluster_role
  }
}

