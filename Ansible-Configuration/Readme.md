
# Using Ansible to configure a target server

### 1. Setting up Ansible server and Target server (EC2 instance)

Firstly i created 2 EC2 instances.
The first one was created for the purpose of installing ansible 
and the second one i created as the target server.

### 2. Ansible installation

I Needed to install Ansible on an EC2 instance.
For this i chose Ubuntu.

When entering your EC2 make first run 
`sudo apt update` then run `sudo apt install ansible`

### 3. Configure passwordless authentication using ssh-keygen

once set up i entered into the original EC2 and generated a public key using 
`ssh-keygen` 

Make you copy the public key and NOT the private key. 
Paste that key into the target server using 

`vim /home/ubuntu/.ssh/authorized_keys `

(Your folders and directories may look different)

Now you should be able to ssh in to the server using 

`ssh ip.address`

### 4. Ansible adhoc commands

Next next we will create a folder within the target server from your main server. 
As the prerequisites are complete this will be quick.

ansible -i inventory all -m "shell" -a "touch devopsclass"

![alt text](file:///c%3A/Users/Hassan/Downloads/ansible%20image%201.JPG)

Here is what it should look like. If there are any errors there will be red writing

Now to check if this was created within the target server

![alt text](file:///c%3A/Users/Hassan/Downloads/ansible%20image%202.JPG)

### 5. Ansible playbook

Next i created an Ansible playbook using
`vim first-playbook.yml`

This file is attached to the repo

Once playbook is created i ran this using the code below
`ansible-playbook -i inventory first-playbook.yml `

![alt text](file:///c%3A/Users/Hassan/Downloads/ansible%203.JPG)

