#!/bin/bash

APP_BASE_PATH="/app"

docker build \
    -f Dockerfile \
    --tag dev-$(basename `git rev-parse --show-toplevel`) \
    . \
&& docker run -it \
    --rm \
    --mount type=bind,source="$(pwd)/src",target=$APP_BASE_PATH/src \
    --mount type=bind,source="$(pwd)/dagster_mount",target=$APP_BASE_PATH/dagster_mount \
    -p 3000:3000 \
    --env DAGSTER_HOME="$APP_BASE_PATH/dagster_mount" \
    dev-$(basename `git rev-parse --show-toplevel`) \
    bash
