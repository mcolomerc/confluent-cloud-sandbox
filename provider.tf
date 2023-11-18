terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent" 
      configuration_aliases = [ confluent.confluent_cloud ]
    
    } 
  }  
} 

provider "confluent" { 
  alias = "confluent_cloud" 
  cloud_api_key    = var.confluent_cloud_api_key
  cloud_api_secret = var.confluent_cloud_api_secret
}