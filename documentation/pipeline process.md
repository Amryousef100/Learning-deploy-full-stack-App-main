# Circleci pipeline process overview:
 
   1. Push the updated code to Github repo main branch.

   2. Merge any updated code to main

   3. CircleCI take the updated code and deploys it to AWS.


   *************************************************************************

   
To achieve the Pipeline process requires the preparation of four fulfillment of four items

1 – deploy the app to the aws cloud Manually SET UP [RDS , S3 , elasticbeanstalk] to get 

Some information you will need to preparation the config.yml file inside a folder .elasticbeanstalk where it

 need name of the app in elasticbeanstalk  (udagrame-api) and
  name of environment of elasticbeanstalk ( Udagrameapi-env  )  

  and  In the same way in file deploy.sh where need name of the app in elasticbeanstalk  (udagrame-api) 

   and  name of environment of elasticbeanstalk    ( Udagrameapi-env  )    This is for back -end  udgram-api


As for the  front-end ( udgaram–frontend) in file deploy.sh it need name of the app in s3 bucket 

```
public-read ./www s3://engamryoussef-udagram/
aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./www/index.html s3://engamryoussef-udagram/

``````
In addition to
Circleci  will need to 
Creating an IAM user in your AWS account
Define user permissions for the IAM user
Create access key and secret for the IAM user to get values of 
AWS_REGION,  AWS_SECRET_KEY  and  AWS_ACCESS_KEY  to
add environment variables in my Circle CI project for

````````
AWS_ACCESS_KEY_ID	=AKIA3GQSX5L7LVQH2O6O
AWS_BUCKET=	engamryoussef-udagram
AWS_DEFAULT_REGION=	us-east-1
AWS_SECRET_ACCESS_KEY	=EzzMPZFkKHD7JRXuvJxymBTFeG8ZVTOvXz90zldB
DB_PORT=	5432
JWT_SECRET=	MyJWTSecret
POSTGRES_DB	=postgres
POSTGRES_HOST	=postgres.ce9htnhv9mbz.us-east-1.rds.amazonaws.com
POSTGRES_PASSWORD	=engamryoussef
POSTGRES_USERNAME	=postgres
URL=	Udagrameapi-env.eba-ym3x5z8s.us-east-1.elasticbeanstalk.com

`````````

2-Create a config.yml file containing :

CircleCI version: This is simply indicating which version of the platform our pipeline should use.

Orbs are a set of instructions created by CircleCi that allow us to configure the pipeline on which we will run our actions.
 These instructions will instruct the server to setup specific software on the server executing our pipeline. 
i used  orbs to setup node.js and install the AWS CLI 
Jobs are groups of commands that i want to run. This is where il run commands to 

1-	install, is the step responsible for calling npm install to download node modules 

2-	Build  is is the step responsible for calling the build script of our application

3- deploy application is ithe step responsible deploy front- end and back- end application


Workflows are instructions about the order of the jobs.
 They allow us to create complex flows and specify manual approvals. 


i edit the .circleci/config.yml and add more commands that CircleCI will run. 

Before doing this, I add scripts in our root package.json.


{
    "scripts": {
        "frontend:install": "cd udagram/udagram-frontend && npm install -f",
        "frontend:start": "cd udagram/udagram-frontend && npm run start",
        "frontend:build": "cd udagram/udagram-frontend && npm run build",
        "frontend:test": "cd udagram/udagram-frontend && npm run test",
        "frontend:e2e": "cd udagram/udagram-frontend && npm run e2e",
        "frontend:lint": "cd udagram/udagram-frontend && npm run lint",
        "frontend:deploy": "cd udagram/udagram-frontend && npm run deploy",
        "api:install": "cd udagram/udagram-api && npm install .",
        "api:build": "cd udagram/udagram-api && npm run build",
        "api:start": "cd udagram/udagram-api && npm run dev",
        "api:deploy": "cd udagram/udagram-api && npm run build && chmod +x ./bin/deploy.sh && ./bin/deploy.sh",
        "deploy": "npm run api:deploy && npm run frontend:deploy"
    }
}

3-	Upload the application code to your own GitHub. I can find the code here

4-	Register with CircleCI for a free account

Navigate to the CircleCI dashboard.

Go to the "project details" page of the project you are using.

Click on "project details" and navigate to "environment variables"
.
And add  name and values that was mentioned earlier 

