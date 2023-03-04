#!/bin/bash

CONTAINER_NAME=dev-pip-tools-$(basename `git rev-parse --show-toplevel`)

docker build \
    -f Dockerfile \
    --target pip-tools-install \
    --tag $CONTAINER_NAME \
    . \
&& docker run -it \
    --rm \
    --mount type=bind,source="$(pwd)/src",target=/opt/src \
    $CONTAINER_NAME \
    bash -c "pip-compile -o requirements.txt pyproject.toml && pip-compile --extra=dev -o dev-requirements.txt pyproject.toml"


