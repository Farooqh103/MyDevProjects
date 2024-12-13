#Creating an EC2 Instance using Terraform

### 1. Create a Terraform file to initialise

For this all that i needed to do was create the `main.tf` file thats attached to this repository adn save it within the terraform folder.

Then run `terraform init` to initialise it

![terraform 1](https://github.com/user-attachments/assets/e239e011-557f-47b4-99c4-d0b15976b7a6)


### 2. Using Terraform Plan

Now at this stage you usually use `terraform plan` so you can preview your changes however i ran into an issue.

![terraform 2](https://github.com/user-attachments/assets/885163c4-c42f-449c-8e57-b0c35bf7b947)


To fix this i had to make sure my AWS CLI was configured correctly.

### 3. Configuring AWS

Start by running `aws configure`

![terraform 3](https://github.com/user-attachments/assets/82c81e05-b73f-4088-828d-215163e87c3a)

`Go to your aws account → top right corner profile → security credentials → scroll down to find access keys → copy them into their respective spaces on your command line`

Now run `terraform plan`

![terraform 4](https://github.com/user-attachments/assets/507a77c7-c6db-42d2-9251-83c6a2609a25)

### 4. Terraform apply 

run the command `terraform apply`

![terraform 5](https://github.com/user-attachments/assets/f5ed8c1a-bd41-4f76-ac97-56e5732b4d16)

![terraform 6](https://github.com/user-attachments/assets/35682418-dfb0-4830-9c6d-307fc5fc1a0c)


This should have created your EC2 in your account

![terraform 7](https://github.com/user-attachments/assets/b0680083-373f-42bd-a9eb-dc640f647d60)
