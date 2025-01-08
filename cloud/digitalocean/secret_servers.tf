# vault cluster vars
resource "digitalocean_tag" "secret_server_role" {
  name = "secret_${var.server_role}"
}
resource "digitalocean_droplet" "vault_server_01_droplet" {
  image = var.droplet_image
  name = "vault-${var.server_role}-01"
  region = var.datacenter_name
  size = var.droplet_size_2g
  ssh_keys = [var.ssh_fingerprint]
  tags = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.secret_server_role.name,
    digitalocean_tag.discovery_client_role.name
  ]
}
resource "ansible_host" "vault_server_01_droplet" {
  inventory_hostname = digitalocean_droplet.vault_server_01_droplet.name
  groups = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.secret_server_role.name,
    digitalocean_tag.discovery_client_role.name,
  ]
  vars = {
    ansible_host = digitalocean_droplet.vault_server_01_droplet.ipv4_address
    ansible_python_interpreter = var.ansible_python_interpreter
    datacenter_name = var.datacenter_name
    cluster_role = var.leader_cluster_role
  }
}
resource "digitalocean_droplet" "vault_server_02_droplet" {
  image = var.droplet_image
  name = "vault-${var.server_role}-02"
  region = var.datacenter_name
  size = var.droplet_size_2g
  ssh_keys = [
    var.ssh_fingerprint]
  tags = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.secret_server_role.name,
    digitalocean_tag.discovery_client_role.name
  ]
}
resource "ansible_host" "vault_server_02_droplet" {
  inventory_hostname = digitalocean_droplet.vault_server_02_droplet.name
  groups = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.secret_server_role.name,
    digitalocean_tag.discovery_client_role.name,
  ]
  vars = {
    ansible_host = digitalocean_droplet.vault_server_02_droplet.ipv4_address
    ansible_python_interpreter = var.ansible_python_interpreter
    datacenter_name = var.datacenter_name
    cluster_role = var.follower_cluster_role
  }
}
resource "digitalocean_droplet" "vault_server_03_droplet" {
  image = var.droplet_image
  name = "vault-${var.server_role}-03"
  region = var.datacenter_name
  size = var.droplet_size_2g
  ssh_keys = [
    var.ssh_fingerprint]
  tags = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.secret_server_role.name,
    digitalocean_tag.discovery_client_role.name
  ]
}
resource "ansible_host" "vault_server_03_droplet" {
  inventory_hostname = digitalocean_droplet.vault_server_03_droplet.name
  groups = [
    digitalocean_tag.target_env.name,
    digitalocean_tag.secret_server_role.name,
    digitalocean_tag.discovery_client_role.name,
  ]
  vars = {
    ansible_host = digitalocean_droplet.vault_server_03_droplet.ipv4_address
    ansible_python_interpreter = var.ansible_python_interpreter
    datacenter_name = var.datacenter_name
    cluster_role = var.follower_cluster_role
  }
}

