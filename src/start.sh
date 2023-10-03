#!/bin/bash

# /bin/sh -c "while sleep 1000; do :; done"
dagster dev -f dagster_project/hello_dagster.py -h 0.0.0.0
