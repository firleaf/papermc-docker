#!/usr/bin/env bash

[[ -z "$VERSION" ]] && echo "Environment variable VERSION must be set." && exit 1
[[ -z "$BUILD" ]] && echo "Environment variable BUILD must be set." && exit 1

TAG="${VERSION}-${BUILD}"

docker build --build-arg VERSION=$VERSION --build-arg BUILD=$BUILD -t ghcr.io/firleaf/papermc-docker:$TAG .
docker push ghcr.io/firleaf/papermc-docker:$TAG