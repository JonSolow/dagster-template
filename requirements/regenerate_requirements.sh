
#!/bin/bash

set -ex

ADDITIONAL_ARGS=$@

pip-compile \
    -o requirements.txt \
    $ADDITIONAL_ARGS \
    pyproject.toml
    
pip-compile \
    --extra=dev \
    -o dev-requirements.txt \
    $ADDITIONAL_ARGS \
    pyproject.toml
