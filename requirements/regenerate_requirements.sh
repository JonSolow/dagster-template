
#!/bin/bash

set -ex

pip-compile \
    -o requirements.txt \
    pyproject.toml
    
pip-compile \
    --extra=dev \
    -o dev-requirements.txt \
    pyproject.toml"


