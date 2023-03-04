#!/bin/bash

set -e

APP_DIR="./dagster_project"

echo "******Running black**********"
black --check --diff $APP_DIR

echo "******Running flake8**********"
flake8 --config tox.ini $APP_DIR


echo "******Running mypy**********"
mypy $APP_DIR --config-file tox.ini
