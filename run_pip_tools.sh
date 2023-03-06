#!/bin/bash

CONTAINER_NAME=dev-pip-tools-$(basename `git rev-parse --show-toplevel`)

# Remove requirements files before regenerating
rm requirements/requirements.txt
rm requirements/dev-requirements.txt

docker build \
    -f Dockerfile \
    --target pip-tools-install \
    --tag $CONTAINER_NAME \
    . \
&& docker run -it \
    --rm \
    --mount type=bind,source="$(pwd)/requirements",target=/opt/src \
    $CONTAINER_NAME \
    bash -c "pip-compile -o requirements.txt pyproject.toml && pip-compile --extra=dev -o dev-requirements.txt pyproject.toml"


