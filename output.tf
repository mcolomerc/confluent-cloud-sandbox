output "cluster_id" {
  value = module.cluster.cluster.id
} 

output "cluster" {
  value = module.cluster.cluster 
} 

output "cluster_api_key" {
  value = module.cluster_admin_service_account.service_account_kafka_api_key
  sensitive = true
}

 