  terraform {
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.83.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# ----------------------------------
# IAM Roles and Policy configuration
# ----------------------------------

# Create custom Policy

resource "aws_iam_policy" "gd_sns_policy" {
  name        = "gd_sns_policy"
 

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
     "Version": "2012-10-17",
    "Statement": [
      {
            "Effect": "Allow",
            "Action": "sns:Publish",
            "Resource": "arn:aws:sns:us-east-1:710271910412:gd_topic"
      },
    ]
  })

}

# Create custom role

resource "aws_iam_role" "lambdanotif_role" {
  name = "lambdanotif_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "lambda.amazonaws.com"
                ]
            }
        }
    ]
})
}
  
# Attach the Policy to the IAM Role
resource "aws_iam_role_policy_attachment" "Custom_policy_to_role" {
  role       = aws_iam_role.lambdanotif_role.name
  policy_arn = aws_iam_policy.gd_sns_policy.arn
}

# Attach an AWS-Managed Policy to the IAM Role
resource "aws_iam_role_policy_attachment" "AWS_lambda_policy_to_role" {
  role       = aws_iam_role.lambdanotif_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# ----------------------------------
# Keys variable creation
# ----------------------------------

# variables.tf
variable "NBA_API_KEY" {
  description = "NBA API Key"
  type        = string
  sensitive   = true
}

variable "SNS_TOPIC_ARN" {
  description = "SNS Topic ARN"
  type        = string
  sensitive   = true
}

# ----------------------------------
# Create Lambda Function
# ----------------------------------


resource "aws_lambda_function" "test_lambda" {
  
  filename      = "src/lambda_function_python.zip"
  function_name = "gd_notification"
  role          =  aws_iam_role.lambdanotif_role.arn
  handler       = "gd_notifications.lambda_handler"
  runtime       = "python3.13"

  environment {
    variables = {

      NBA_API_KEY   = var.NBA_API_KEY
      SNS_TOPIC_ARN = var.SNS_TOPIC_ARN

    }
}
}

# ----------------------------------
# Create EventBridge
# ----------------------------------

resource "aws_cloudwatch_event_rule" "Lambda_event" {
  name                = "Run_lambda"
  description         = "Runs the Lambda function every 10 minutes"
  schedule_expression = "cron(0/10 * * * ? *)"
}

# Event Target
resource "aws_cloudwatch_event_target" "lambda" {
  rule      = aws_cloudwatch_event_rule.Lambda_event.name
  target_id = "RunLambdaTarget"
  arn       = aws_lambda_function.test_lambda.arn
}

# Lambda Permission
resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowEventBridgeInvocation"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.Lambda_event.arn
}
