# Online-tech-challenge

**Challenge-1**

PIPELINE

Overview :

This pipeline is used to set up a 3 tier architecture like new VPC Network in GCP by defining the network and subnet ranges information.

Config :

The config folder contains the network and the subnet module information. The project modules in config folder calls the modules defined in vpc-subnet-proj

All the configurations related to a project are grouped as <file_name>.tf under the config folder as below :

  Config
     vpc-subnet.tf

Main :

The main folder contains different terraform files to configure terraform backend, provider information and invoking the configurations :

1. backend.tf :

The Terraform configuration specifies a backend, which defines where and how operations are performed and where the state snapshots are stored.

The usage module is as below :

terraform {
  backend "gcs" {
    bucket = "demo-bucket"
    prefix = "terraform/state"
  }
}
The storage bucket for this pipeline is in vpc-subnet-proj project and the name of the bucket is demo-bucket

2. main.tf :

In this file we specify the source and the billing id of the project.

The usage module is as below :

module "testgmod-network" {
  source = "../config/"
}

3. output.tf :

Output values are the return values of a Terraform module. Each output value exported by a module must be declared using an output block.

4. providers.tf :

Terraform relies on plugins called "providers" to interact with remote systems.
Terraform configurations must declare which providers they require so that Terraform can install and use them.

5. terraform.tfvars :

Terraform automatically loads all files in the current directory with the exact name of terraform.tfvars or any variation of *.auto.tfvars.These files use the same syntax as Terraform configuration files.

6. variables.tf :

This file contains the input variables. Input variables serve as parameters for a Terraform module, allowing aspects of the module to be customized without altering the module's own source code, and allowing modules to be shared between different configurations.

The variables specified in pipeline are:

variable "org_id" {
  type        = string
  description = "The resource name of the Organization"
}

Service Account and IAM Roles:

Pipeline is using a service account. The service account associated with this project is :
"serviceAccount:demo-service-account.iam.gserviceaccount.com"

The service account is defined with IAM roles like :

   Roles:
     - roles/compute.networkAdmin
     
Cloud Build :

Cloud Build runs the build steps defined in the cloudbuild.yaml file.
The cloudbuild.yaml file contains the series of steps to perform cloud build operations for downloading modules, initiating plan, validating plan, creating execution plan and applying plan. Any change to the cloud source repository triggers the cloud build automatically.


**Challenge-2**

Using below command you can access the server metadata:

$gcloud compute ssh --project proj-test --zone us-west1-b test-vm --command="curl \"http://metadata.google.internal/computeMetadata/v1/instance/image\" -H \"Metadata-Flavor: Google\""

In command section we can give below commands:

curl "http://metadata.google.internal/computeMetadata/v1/instance/image" -H "Metadata-Flavor: Google"

curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/" -H "Metadata-Flavor: Google"

curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/0/" -H "Metadata-Flavor: Google"

curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/0/type" -H "Metadata-Flavor: Google"

curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/0/type" -H "Metadata-Flavor: Google"

curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/?recursive=true" -H "Metadata-Flavor: Google"

curl "http://metadata.google.internal/computeMetadata/v1/instance/tags" -H "Metadata-Flavor: Google"

curl "http://metadata.google.internal/computeMetadata/v1/METADATA_KEY?wait_for_change=true" -H "Metadata-Flavor: Google"

curl -v "http://metadata.google.internal/computeMetadata/v1/instance/tags" -H "Metadata-Flavor: Google"
