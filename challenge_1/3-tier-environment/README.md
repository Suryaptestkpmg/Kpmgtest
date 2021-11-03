A three-tier architecture is a software architecture pattern where the application is broken down into three logical tiers: the presentation layer, the business logic layer and the data storage layer. This architecture is used in a client-server application such as a web application that has the frontend, the backend and the database. Each of these layers or tiers does a specific task and can be managed independently of each other.


AWS is being used as a platform to build three-tier architecture.

-Prerequisites:

--Terraform version v1.0.9

--AWS subscription with Access Key and Secret Key

-Provisioning through Terraform and steps mentioned below:
1. Go to 3-tier-environment folder
2. Run terraform init command to initialize a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control
 
    terraform init
  
3. Run terraform plan to check execution plan with a preview of the changes that Terraform will make to in to the AWS
  
    terraform plan
  
4. Run terraform apply will implement the planned changes.

    terraform apply
    




