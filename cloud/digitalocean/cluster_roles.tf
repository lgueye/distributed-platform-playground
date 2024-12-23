# cluster roles
variable "leader_cluster_role" {
  default = "leader"
}
variable "follower_cluster_role" {
  default = "follower"
}

variable "server_role" {
  default = "server"
}
variable "client_role" {
  default = "client"
}

variable "java_role" {
  default = "java_runtime"
}

resource "digitalocean_tag" "leader_role" {
  name = var.leader_cluster_role
}
resource "digitalocean_tag" "follower_role" {
  name = var.follower_cluster_role
}
resource "digitalocean_tag" "java_role" {
  name = var.java_role
}
resource "digitalocean_tag" "discovery_client_role" {
  name = "discovery_${var.client_role}"
}

# resource "digitalocean_tag" "metrics_client_role" {
#   name = "metrics_${var.client_role}"
# }
