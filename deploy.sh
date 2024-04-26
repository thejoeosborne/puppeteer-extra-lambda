#!/bin/bash

echo "command - npx tsc"
npx tsc

echo "command - aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com"
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com

echo "command - docker build --platform linux/amd64 --progress=plain -t custom-scraping ."
docker build --platform linux/amd64 --progress=plain -t custom-scraping .

echo "command - docker tag custom-scraping:latest <account-id>.dkr.ecr.<region>.amazonaws.com/custom-scraping:latest"
docker tag custom-scraping:latest <account-id>.dkr.ecr.<region>.amazonaws.com/custom-scraping:latest

echo "command - docker push <account-id>.dkr.ecr.<region>.amazonaws.com/custom-scraping:latest"
docker push <account-id>.dkr.ecr.<region>.amazonaws.com/custom-scraping:latest