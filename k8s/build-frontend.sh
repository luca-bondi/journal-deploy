#!/bin/bash
# Build docker image for frontend and push to docker registry

source ../frontend.env
REACT_APP_VERSION=v$(dunamai from git --no-metadata --path ../frontend)

IMAGE_TAG=unklb197/bondibrown:saj-frontend-${REACT_APP_VERSION}

echo "Building frontend image: $IMAGE_TAG"

docker build --platform linux/amd64 \
--build-arg REACT_APP_VERSION=$(echo $REACT_APP_VERSION) \
--build-arg REACT_APP_API_URL=$(echo $REACT_APP_API_URL) \
--build-arg REACT_APP_FIEF_URL=$(echo $REACT_APP_FIEF_URL) \
--build-arg REACT_APP_FIEF_CLIENT_ID=$(echo $REACT_APP_FIEF_CLIENT_ID) \
-t $IMAGE_TAG ../frontend/

echo "Pushing frontend image: $IMAGE_TAG"

docker push $IMAGE_TAG