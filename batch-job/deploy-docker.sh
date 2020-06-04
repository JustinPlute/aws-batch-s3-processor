#!/bin/bash

ACCOUNT=123456789012 # REMEMBER TO REPLACE THE AWS ACCOUNT ID
DOCKER_CONTAINER=my-batch-job
REPO=${ACCOUNT}.dkr.ecr.us-west-2.amazonaws.com/${DOCKER_CONTAINER}
TAG=build-$(date -u "+%Y-%m-%d")

echo "Building Docker Image..."
docker build -t $DOCKER_CONTAINER .

echo "Authenticating against AWS ECR..."
eval $(aws ecr get-login --no-include-email --region us-west-2)

echo "Tagging ${REPO}..."
docker tag $DOCKER_CONTAINER:latest $REPO:$TAG
docker tag $DOCKER_CONTAINER:latest $REPO:latest

echo "Deploying to AWS ECR"
docker push $REPO
