# Confluent Cloud Sandbox

Managing Confluent Cloud using Terraform. 

## Prerequisites

Create a Confluent Cloud Cloud API Key

Create a service account called `tf_runner`in Confluent Cloud

Assign the `OrganizationAdmin` role to the `tf_runner` service account

Create a Cloud API Key for the `tf_runner` service account

## Environment Variables

Terraform will use the following environment variables to authenticate with Confluent Cloud.

```bash
export CONFLUENT_CLOUD_API_KEY="<CONFLUENT_CLOUD_API_KEY>"
export CONFLUENT_CLOUD_API_SECRET="<CONFLUENT_CLOUD_API_SECRET>"
```

## Variables

1. Provide a Confluent Cloud Environment ID.

- `environment`: Confluent Cloud Environment ID

2. Provide Cluster details

- `cluster`: Cluster map.(Defaults)
  - `display_name` = "sandbox"
  - `availability` = "SINGLE_ZONE"
  - `cloud`        = "GCP"
  - `region`       = "europe-west1"
  - `type`         = "BASIC"
  
3. Provide a Service Account Name to create a *ClusterAdmin* role binding. 

- `service_account`: Service Account Name

## Terraform

```bash
terraform init
```

Build the plan.

```bash
terraform plan --var-file=sandbox.tfvars
```

Apply - Using `auto-approve` skips interactive approval of plan before applying.

```bash
terraform apply -auto-approve --var-file=sandbox.tfvars
```

1. Outputs

- Cluster Bootstrap Server endpoint:

```bash
terraform show -json terraform.tfstate | jq '.values.outputs.cluster.value.bootstrap_endpoint'
```

- Confluent Cloud Cluster API_KEY:

```bash
terraform show -json terraform.tfstate | jq '.values.outputs.cluster_api_key.value.id'
```

- Confluent Cloud Cluster API_SECRET:

```bash
terraform show -json terraform.tfstate | jq '.values.outputs.cluster_api_key.value.secret'
```

## Destroy

```bash
terraform destroy --var-file=sandbox.tfvars
```

or

```bash
terraform apply -auto-approve -destroy --var-file=sandbox.tfvars
```

<!-- BEGIN_TF_DOCS -->
 
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster"></a> [cluster](#module\_cluster) | github.com/mcolomerc/terraform-confluent-kafka-cluster | v1.0.0 |
| <a name="module_cluster_admin_service_account"></a> [cluster\_admin\_service\_account](#module\_cluster\_admin\_service\_account) | github.com/mcolomerc/terraform-confluent-iam | v1.0.2 |
 
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Cluster | `map(any)` | <pre>{<br>  "availability": "SINGLE_ZONE",<br>  "cloud": "GCP",<br>  "display_name": "sandbox",<br>  "region": "europe-west1",<br>  "type": "BASIC"<br>}</pre> | no |
| <a name="input_confluent_cloud_api_key"></a> [confluent\_cloud\_api\_key](#input\_confluent\_cloud\_api\_key) | Confluent Cloud API Key | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_secret"></a> [confluent\_cloud\_api\_secret](#input\_confluent\_cloud\_api\_secret) | Confluent Cloud API Secret | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service Account Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
| <a name="output_cluster_api_key"></a> [cluster\_api\_key](#output\_cluster\_api\_key) | n/a |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
<!-- END_TF_DOCS -->