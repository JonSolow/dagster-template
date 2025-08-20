
#!/bin/bash

set -ex

ADDITIONAL_ARGS=$@

uv pip compile \
    -o requirements.txt \
    $ADDITIONAL_ARGS \
    pyproject.toml
    
uv pip compile \
    --extra=dev \
    -o dev-requirements.txt \
    $ADDITIONAL_ARGS \
    pyproject.toml
