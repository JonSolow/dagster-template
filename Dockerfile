FROM python:3.11-slim AS base
COPY --from=ghcr.io/astral-sh/uv:0.8.12 /uv /usr/local/bin/uv
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

FROM base as python-base
ENV APP_BASE_PATH="/app"
ENV APP_SRC_PATH=${APP_BASE_PATH}/src
ENV PYTHONPATH="${APP_SRC_PATH}:${PYTHONPATH}"
WORKDIR $APP_BASE_PATH

FROM python-base as common-app-setup
WORKDIR ${APP_BASE_PATH}
EXPOSE 3000
ENTRYPOINT ["./start.sh"]


FROM common-app-setup as base-python-install
COPY requirements.txt .
RUN uv pip sync --system requirements.txt

FROM base-python-install as dev-python-install
COPY dev-requirements.txt .
RUN uv pip sync --system dev-requirements.txt

FROM base-python-install as service
WORKDIR ${APP_SRC_PATH}
COPY ./src .

FROM dev-python-install as development
WORKDIR ${APP_SRC_PATH}