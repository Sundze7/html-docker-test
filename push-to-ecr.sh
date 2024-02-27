#!/bin/bash

# Replace these values with your own
AWS_REGION="ca-central-1"
ECR_REPOSITORY="828804287617.dkr.ecr.ca-central-1.amazonaws.com/webtest"
DOCKER_IMAGE_NAME="webtest"

# Build the Docker image
docker build -t $DOCKER_IMAGE_NAME .

# Tag the Docker image with ECR repository URI
DOCKER_IMAGE_URI="$ECR_REPOSITORY"
docker tag $DOCKER_IMAGE_NAME $DOCKER_IMAGE_URI

# Log in to ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $DOCKER_IMAGE_URI

# OR
# AWS_LOGIN_CMD=$(aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $DOCKER_IMAGE_URI)
# eval $AWS_LOGIN_CMD

# Push the Docker image to ECR
docker push $DOCKER_IMAGE_URI