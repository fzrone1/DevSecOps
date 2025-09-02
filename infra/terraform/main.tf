terraform {
  required_providers {
    civo = {
      source  = "civo/civo"
      version = "1.0.46"
    }
  }
  required_version = ">= 1.3.0"
}

provider "civo" {
  token = ""
  region = var.region
}

# Network default
data "civo_network" "default" {
  label = "default"
}

# Firewall
resource "civo_firewall" "demo_fw" {
  name       = "demo-firewall"
  network_id = data.civo_network.default.id

  ingress_rule {
    label      = "http"
    protocol   = "tcp"
    port_range = "80"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }

  ingress_rule {
    label      = "https"
    protocol   = "tcp"
    port_range = "443"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }

  ingress_rule {
    label      = "ssh"
    protocol   = "tcp"
    port_range = "22"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }
}

# Kubernetes Cluster
resource "civo_kubernetes_cluster" "demo" {
  name           = "hello-k8s"
  firewall_id    = civo_firewall.demo_fw.id
  applications   = "Traefik"
  pools {
    node_count = 1
    size       = "g3.k3s.small"
  }
}
