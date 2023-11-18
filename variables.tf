variable "confluent_cloud_api_key" {
  description = "Confluent Cloud API Key"
  type        = string
}

variable "confluent_cloud_api_secret" {
  description = "Confluent Cloud API Secret"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "service_account" {
  description = "Service Account Name"
  type        = string
}

variable "cluster" {
  description = "Cluster"
  type        = map(any)
  default = {
    display_name = "sandbox"
    availability = "SINGLE_ZONE"
    cloud        = "GCP"
    region       = "europe-west1"
    type         = "BASIC"
  }
}
