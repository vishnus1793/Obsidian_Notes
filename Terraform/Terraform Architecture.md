## Basic components of Terraform architecture

The basic components of Terraform architecture include Terraform core, providers, configuration files, and state management.

- **Terraform core** is the engine that reads configuration files, manages state, and executes plans to apply changes.
- **Providers** are responsible for interacting with APIs of services like AWS, Azure, or Kubernetes to provision resources.
- **Configuration files**, written in HashiCorp Configuration Language (HCL), define the desired infrastructure in a human-readable format.
- **State management** tracks the current infrastructure setup, allowing Terraform to compare it with the desired state and determine necessary changes.

Below you can see the Terraform architecture diagram:

![[Pasted image 20260522003336.png|697]]

### 1. Terraform core

Terraform’s core (also known as Terraform CLI) is built on a statically compiled binary developed using the Go programming language.

This binary generates the command-line tool (CLI) “terraform,” which serves as the primary interface for Terraform users. It can be accessed on the Terraform GitHub repository.

### 2. Providers

[Terraform providers](https://spacelift.io/blog/terraform-providers) are modules that enable Terraform to communicate with a diverse range of services and resources, including but not limited to cloud providers, databases, and DNS services. 

Each provider is responsible for defining the resources that Terraform can manage within a particular service and translating Terraform configurations into API calls that are specific to that service.

Providers are available for numerous services and resources, including those developed by major cloud providers like AWS, Azure, and Google Cloud, as well as community-supported providers for various services. By utilizing providers, Terraform users can maintain their infrastructure consistently and reproducibly, regardless of the underlying service or provider. 

### 3. State file

The [Terraform state file](https://spacelift.io/blog/terraform-state) is an essential aspect of Terraform’s functionality. It is a JSON file that stores information about the resources that Terraform manages, including their current state and dependencies. 

Terraform utilizes the state file to determine the changes that need to be made to the infrastructure when a new configuration is applied. It also ensures that resources are not unnecessarily recreated across multiple runs of Terraform. 

The [state file can be kept](https://spacelift.io/blog/terraform-backends) locally on the machine running Terraform or remotely using a remote backend like Azure Storage Account or [Amazon S3](https://spacelift.io/blog/terraform-s3-backend), or HashiCorp Consul. It is crucial to safeguard the state file and maintain frequent backups since it contains sensitive information about the infrastructure being managed.

### 4. Configuration files

Terraform’s structure is based on modular, human-readable configuration files written in HashiCorp Configuration Language (HCL). These files define infrastructure components like resources, providers, variables, and outputs.

Each configuration starts with a provider block that specifies which platform (e.g., AWS, Azure) Terraform should interact with. Resources represent the actual infrastructure to be created, such as virtual machines or databases. Variables enable reusability and flexibility, while outputs expose key information after deployment, such as IP addresses.

## How to structure Terraform files

Declaring resources is very easy in Terraform. [Terraform files](https://spacelift.io/blog/terraform-files) always end with the extension `.tf`.

The basic Terraform file structure contains the following elements.

### Terraform block

A Terraform block specifies the required providers for Terraform to execute the script. This block also contains the source block, which specifies where Terraform should download the provider and the required version.

Below is an example:

```hcl
terraform { 
  required_providers { 
    azurerm = { 
      source  = "hashicorp/azurerm" 
      version = "=3.0.0" 
    } 
  } 
}
```

### Provider block

A provider block specifies the cloud provider and the API credentials required to connect to the provider’s services. It includes the provider name, version, access key, and secret key.

For example, if you are using Azure as your service provider, it would look as follows:

```hcl
provider "azurerm" {
  features {}
  subscription_id = "00000000-0000-0000-0000-000000000000"
  tenant_id = "11111111-1111-1111-1111-111111111111"
}
```

### Resource block

A resource block represents a particular resource in the cloud provider’s services. It includes the resource type, name, and configuration details. This is the main block that specifies the type of resource we are trying to deploy.

Below is an example of creating a resource group in Azure:

```hcl
resource "azurerm_resource_group" "example" { 
  name = "example" 
  location = "West Europe" 
}
```

### Data block

A data block fetches data from the provider’s services, which can be used in resource blocks. It includes the data type and configuration details.

This is used in scenarios where the resource has already been deployed and you would like to retrieve its details.

The code snippet below helps you fetch details of an existing resource group that has already been deployed.

```hcl
data "azurerm_resource_group" "example" { 
  name = "existing" 
}
```

### Variable block

A variable block defines input variables for the Terraform configuration. It includes the variable name, type, and default value.

The following is an example of a variable block in Terraform:

```hcl
variable "resource_group_name" {
  default = "myTFResourceGroup"
}
```

### Output block

An output block defines the [output values](https://spacelift.io/blog/terraform-output) generated by the Terraform configuration. It includes the output name and value.

```hcl
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}
```

### Provisioners

[Terraform provisioners](https://spacelift.io/blog/terraform-provisioners) are a feature that allows Terraform to execute scripts or commands on newly created resources or instances. These scripts can be used for various purposes, such as setting up and configuring the infrastructure, installing software, running tests, and performing any other necessary actions. 

Provisioners are executed after a resource has been created and can also be triggered when a resource is destroyed. Terraform comes with several built-in provisioners, including the file provisioner for copying files to a resource and the remote-exec provisioner for running commands on a remote machine. It is also possible to create custom provisioners for more advanced use cases. 

This is mainly used as a last resort unless you are unable to achieve your desired outcome with existing resource blocks in Terraform.