# AWS Resource Tracker Automation Overview 
This project demonstrates the ability to automate AWS resource tracking using a Bash script that interacts with the AWS CLI. 
The script is designed to help you list and manage key AWS resources such as EC2 Instances, S3 Buckets, Lambda Functions, and IAM Users.

The project also utilises `crontab` which schedules cron jobs to be ran at certain times

Key Features: Automates the process of gathering and listing key AWS resource data. Uses AWS CLI to interact with AWS services. Designed for EC2 instances but easily adaptable to any Linux system with AWS CLI access.

AWS CLI: 

The AWS Command Line Interface (CLI) must be installed and configured with your AWS credentials. 
Ensure that the AWS user has permission to list EC2 instances, S3 buckets, Lambda functions, and IAM users.

Step 1: Create the Script 
Create the aws_resource_tracker.sh file in your EC2 instance or local machine (if you're testing it locally).

Paste `AwsResourceScript.sh` which i have attached with the `README.md`

Step 2: Make the Script Executable 
Once the script is created, grant execute permissions: use `chmod 777 aws_resource_tracker.sh` to grant permissions

Step 3: Run the Script 
Execute the script by running the following command:

`./aws_resource_tracker.sh`

The script will display the following information in the terminal:

List of EC2 Instances
List of S3 Buckets
List of Lambda Functions
List of IAM Users

Automating with Crontab You can schedule the script to run automatically at a specific time every day using cron jobs
To set up a cron job for running the script every day at 9:29 PM, follow these steps:

Open the crontab editor: Use `crontab -e` and add the code from my `crontabscript`.

By running this script regularly, you can keep track of key AWS resources and their usage without manual intervention.

