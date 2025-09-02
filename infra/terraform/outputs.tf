output "kubeconfig" {
  description = "Kubeconfig for accessing the cluster"
  value       = civo_kubernetes_cluster.demo.kubeconfig
  sensitive   = true
}
