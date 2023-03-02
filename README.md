### Steps to Run Terraform
Refer to: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
1. Select the target workspace
```shell
terraform workspace list
terraform workspace select sit
terraform workspace new uat
```

2. Run terraform init
```shell
terraform init
```

3. Set environment variables by substituting AUTHO_DOMAIN, CLIENT_ID, and CLIENT_SECRET for your M2M app's values.
   Refer to
- https://registry.terraform.io/providers/auth0/auth0/latest/docs/guides/quickstart
```shell
export AUTH0_DOMAIN=******
export AUTH0_CLIENT_ID=******
export AUTH0_CLIENT_SECRET=******
```

4. Run terraform plan/apply
```shell
terraform plan -var-file=$(terraform workspace show).tfvars
terraform apply -var-file=$(terraform workspace show).tfvars
```

#### Note:
1. TF state files are stored in this repository
1. Workspace is being used to distinguish between different environments, so remember to select the correct workspace before proceeding
1. Auth0 app values are required to be set in env var before applying and the values are not supposed to be included in the scripts here

### Steps to Export Existing Configuration from Auth0
1. Export the configuration for a defined resource
```shell
terraform import auth0_client.api_client xWRYU7RI8dRBwDvprd0ZrhQRQXFCqF6L
```
2. Output the specific resource in HCL
```shell
terraform state show auth0_client.api_client
```
3. Copy & paste the output into tf file

Refer to: https://registry.terraform.io/providers/auth0/auth0/latest/docs