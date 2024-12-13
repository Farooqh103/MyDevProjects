# Deploying a Node Js Application on AWS EC2

### Testing the project locally

1. Clone this project 
```
git clone /Repo/Link
```
2. Setup the following environment variables - `(.env)` file
   This file is hidden and will contain variables that you dont others to see.

   You can create this file by using `Touch` then editing it with`vi` 
   or just use `Vim` to create then enter it 

   Inside the `.env` add:

```
DOMAIN= ""
PORT=3000
STATIC_DIR="./client"

PUBLISHABLE_KEY=""
SECRET_KEY=""
```

Obtain the keys from `https://stripe.com/gb`. 
Make Account → Settings → Developers → API Keys


3. Initialise and start the project
   For this section you need to install Node.js from `https://nodejs.org/en`

```
npm install
npm run start
```

### Set up an AWS EC2 instance

1. Create an IAM user & login to your AWS Console
    - Access Type - Password
    - Permissions - Admin
2. Create an EC2 instance
    - Select an OS image - Ubuntu
    - Create a new key pair & download `.pem` file
    - Instance type - t2.micro
3. Connecting to the instance using ssh or click connect on AWS Instance itself

For best practice dont give admin access and give only EC2 Access.

```
ssh -i instance.pem ubunutu@<IP_ADDRESS>
```

### Configuring Ubuntu on remote VM

1. Updating the outdated packages and dependencies

for best practice always use the code below to update any vms you are on
```
sudo apt update
```

### Deploying the project on AWS

This part is pretty much the same as the local part witha  few differences

1. Clone this project in the remote VM
```
git clone https://github.com/verma-kunal/AWS-Session.git
```
2. Setup the following environment variables - `(.env)` file
```
DOMAIN= ""
PORT=3000
STATIC_DIR="./client"

PUBLISHABLE_KEY=""
SECRET_KEY=""
```
> For this project, we'll have to set up an [Elastic IP Address](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html) for our EC2 & that would be our `DOMAIN`
> or you can use IPV4 Address that is already provided

3. Initialise and start the project
```
npm install
npm run start
```

You will have to edit the **inbound rules** in the security group of our EC2, in order to allow traffic from our particular port

![alt text](<clone prject ss.jpg>)
### Application is now Hosted🎉

Credit to Kunal Verma for the application code and packages. Link to his Github repo: https://github.com/verma-kunal