# 30 Days DevOps Challenge - Weather Dashboard

Day 1: Building a weather data collection system using AWS S3 and OpenWeather API

# Weather Data Collection System - DevOps Day 1 Challenge

## Project Overview
This project is a Weather Data Collection System that demonstrates core DevOps principles by combining:
- External API Integration (OpenWeather API)
- Cloud Storage (AWS S3)
- Version Control (Git)
- Python Development
- Environment Management
  
![image](https://github.com/user-attachments/assets/2c375748-b6ca-422e-8729-d3b0286ebf71)

## Features
- Fetches real-time weather data for multiple cities
- Displays temperature (°F), humidity, and weather conditions
- Automatically stores weather data in AWS S3
- Supports multiple cities tracking
- Timestamps all data for historical tracking

## Technical Architecture
- **Language:** Python 3.x
- **Cloud Provider:** AWS (S3)
- **External API:** OpenWeather API
- **Dependencies:** 
  - boto3 (AWS SDK)
  - python-dotenv
  - requests

```
## Project Structure
weather-dashboard/
  src/
    __init__.py
    weather_dashboard.py
  tests/
  data/
  .env
  .gitignore
  requirements.txt

## Setup Instructions
1. Initially i could have cloned the repository but i wanted to recreate and do it all myself.
   Create all the files that are within the Project Structure. Then insert the required infomation in each file

2. Before you install it's important you create a virtual environment for python. This wont install as the
   package is being handled externally. This could simply be "Apt".
   So make sure to isolate the environment and install it within there.
   To do this:

   To create a virtual environment 
   python3 -m venv (your virtual environment name)

   Then you have to activate the virtual environment 
   source envname/bin/activate 

3. Install dependencies:
   pip install -r requirements.txt

4. Configure environment variables (.env):
   CopyOPENWEATHER_API_KEY=your_api_key
   AWS_BUCKET_NAME=your_bucket_name

5.Configure AWS credentials:
  aws configure

6. Run the application:
   python src/weather_dashboard.py

![image](https://github.com/user-attachments/assets/e88d4bb1-cf88-448d-9db4-9f60b325d10c)

What I Learned:

AWS S3 bucket creation and management
Environment variable management for secure API keys
Python best practices for API integration
Git workflow for project development
Error handling in distributed systems
Cloud resource management
```

## Massive Thanks to @DeShae Lyda or @ShaeInTheCloud for this tutorial and lab


