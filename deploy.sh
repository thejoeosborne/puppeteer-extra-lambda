#!/bin/bash

echo "command - npx tsc"
npx tsc

echo "command - aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <aws-account-id>.dkr.ecr.<region>.amazonaws.com"
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <aws-account-id>.dkr.ecr.<region>.amazonaws.com

echo "command - docker build --platform linux/amd64 --progress=plain -t scraper ."
docker build --platform linux/amd64 --progress=plain -t scraper .

echo "command - docker tag scraper:latest <aws-account-id>.dkr.ecr.<region>.amazonaws.com/scraper:latest"
docker tag scraper:latest <aws-account-id>.dkr.ecr.<region>.amazonaws.com/scraper:latest

echo "command - docker push <aws-account-id>.dkr.ecr.<region>.amazonaws.com/scraper:latest"
docker push <aws-account-id>.dkr.ecr.<region>.amazonaws.com/scraper:latest