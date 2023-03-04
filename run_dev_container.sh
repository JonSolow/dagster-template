#!/bin/bash

docker build \
    -f Dockerfile \
    --tag dev-$(basename `git rev-parse --show-toplevel`) \
    . \
&& docker run -it \
    --rm \
    --mount type=bind,source="$(pwd)/src",target=/opt/src \
    --mount type=bind,source="$(pwd)/dagster_mount",target=/opt/dagster_mount \
    -p 3000:3000 \
    --env DAGSTER_HOME="/opt/dagster_mount" \
    dev-$(basename `git rev-parse --show-toplevel`) \
    bash
