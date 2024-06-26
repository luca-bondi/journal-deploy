#!/bin/bash
# Build docker image for backend and push to docker registry

BACKEND_VERSION=v$(dunamai from git --no-metadata --path ../backend)
IMAGE_TAG=unklb197/bondibrown:saj-backend-${BACKEND_VERSION}

echo "Building backend image: $IMAGE_TAG"

docker build --platform linux/amd64 \
-t $IMAGE_TAG ../backend/

echo "Pushing backend image: $IMAGE_TAG"

docker push $IMAGE_TAG