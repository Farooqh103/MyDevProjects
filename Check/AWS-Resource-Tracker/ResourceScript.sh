#!/bin/bash

#########################
# Author: Hassan Farooq
# Date: 24th November 2024
# Version: 1.0
#
# This script will report the AWS report usage
##########################


# AWS EC2
# AWS S3
# AWS Lambda
# AWS IAM

#List S3 buckets
echo "Print List of S3 buckets"
aws s3 ls

#List EC2 Instances
echo "Print List of EC2 Instances"
aws ec2 describe-instances

#List Lambda
echo "Print List of Lambda Functions"
aws lambda list-functions

#List IAM Users
echo "Print List of Users"
aws iam list-users