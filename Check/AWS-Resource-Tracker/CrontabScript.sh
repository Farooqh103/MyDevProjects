#!/bin/bash
####################

#Crontab is a scheduling task that can automatically run at specified times.

####################

# This line below represents how i want crontab to run at 9.29pm everyday and store the results and errors into logs
29 21 * * * /home/ec2-user/aws_resource_tracker.sh >> /home/ec2-user/resource_tracker.log 2>&1