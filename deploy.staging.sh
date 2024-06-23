#!/bin/bash -ea

source frontend.env.staging
REACT_APP_VERSION=v$(dunamai from git --no-metadata --path frontend)
docker-compose -f docker-compose.staging.yaml -p saj-staging up --build -d