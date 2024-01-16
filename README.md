# t2micro_with_terraform_on_aws

Demonstration repository for deploying docker/apache to aws with a terraform script.

## Goal

- Create a **n1-standard-1** (GCP) or **t2.micro** (AWS) Linux instance using **Terraform**.
- The instance must only have open ports **80** and **443** for all addresses
- The SSH port (**22**) must only be accessible to a defined IP *range*.
- **Inputs:** Project execution must accept two conditions:
  - The IP or *range* required to release the SSH port
  - The *cloud* region in which the instance will be provisioned
- **Outputs:** The execution must print the public IP of the instance

## Extras

- Pre-install docker on the instance that automatically uploads the [Apache](https://hub.docker.com/_/httpd/) image, making the tool's default page viewable when accessing the instance's public IP
- Use of Terraform modules

```bash
terraform init
terraform apply -var-file=terraform.tfvars
```
