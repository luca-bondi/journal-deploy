#!/bin/bash -ea

source frontend.env
REACT_APP_VERSION=v$(dunamai from git --no-metadata --path frontend)
docker-compose -f docker-compose.prod.yaml -p saj-prod up --build -d