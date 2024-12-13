#Creating an EC2 Instance using Terraform

### 1. Create a Terraform file to initialise

For this all that i needed to do was create the `main.tf` file thats attached to this repository adn save it within the terraform folder.

Then run `terraform init` to initialise it

T1

### 2. Using Terraform Plan

Now at this stage you usually use `terraform plan` so you can preview your changes however i ran into an issue.

T2

To fix this i had to make sure my AWS CLI was configured correctly.

### 3. Configuring AWS

Start by running `aws configure`

T3

`Go to your aws account → top right corner profile → security credentials → scroll down to find access keys → copy them into their respective spaces on your command line`

Now run `terraform plan`
T4

### 4. Terraform apply 

run the command `terraform apply`

T5
T6

This should have created your EC2 in your account

T7