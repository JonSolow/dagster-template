
#!/bin/bash

set -ex

ADDITIONAL_ARGS=$@

pip-compile \
    --resolver=backtracking \
    -o requirements.txt \
    $ADDITIONAL_ARGS \
    pyproject.toml
    
pip-compile \
    --resolver=backtracking \
    --extra=dev \
    -o dev-requirements.txt \
    $ADDITIONAL_ARGS \
    pyproject.toml
