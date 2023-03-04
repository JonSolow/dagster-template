FROM python:3.10.10-slim-buster AS base
RUN apt-get update

FROM base as python-base
RUN curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 -
ENV APP_BASE_PATH="/opt/src"
RUN mkdir -p ${APP_BASE_PATH}
ENV PYTHONPATH="${APP_BASE_PATH}:${PYTHONPATH}"


FROM python-base as pip-tools-install
RUN python3 -m pip install pip-tools
WORKDIR ${APP_BASE_PATH}

FROM pip-tools-install as base-python-install
COPY src/requirements.txt .
RUN pip-sync requirements.txt

FROM base-python-install as dev-python-install
COPY src/dev-requirements.txt .
RUN pip-sync dev-requirements.txt
