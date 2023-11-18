// CREATE A CONFLUENT CLOUD CLUSTER
module "cluster" { 
    source          = "github.com/mcolomerc/terraform-confluent-kafka-cluster?ref=v1.0.0"
    environment     = var.environment
    cluster         = var.cluster
    providers = {
      confluent.confluent_cloud = confluent.confluent_cloud
    }
}

// Service Accounts - ClusterAdmin RoleBindings
module "cluster_admin_service_account" { 
  source   = "github.com/mcolomerc/terraform-confluent-iam?ref=v1.0.2"
  providers = {
    confluent = confluent.confluent_cloud
  }
  environment     = var.environment
  cluster_role_bindings = {
    service_account = var.service_account
    cluster         = module.cluster.cluster.id
    sa_role_bindings = [{
      role = "CloudClusterAdmin"
      name     = "cluster"
    }]
  } 
  depends_on = [  
   module.cluster
  ]
} 

