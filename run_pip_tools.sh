#!/bin/bash

CONTAINER_NAME=dev-pip-tools-$(basename `git rev-parse --show-toplevel`)


docker build \
    -f Dockerfile \
    --target pip-tools-install \
    --tag $CONTAINER_NAME \
    . \
&& docker run -it \
    --rm \
    --mount type=bind,source="$(pwd)/requirements",target=/opt/src \
    $CONTAINER_NAME \
    bash
