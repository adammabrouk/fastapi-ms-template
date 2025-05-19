# ---- Builder Stage ----
FROM python:3.11-slim as builder

ARG POETRY_VERSION=2.1.2
ENV POETRY_HOME="/opt/poetry" \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=true

ENV PATH="$POETRY_HOME/bin:$PATH"

# Install Poetry using the official installer
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    curl -sSL https://install.python-poetry.org | python3 - --version ${POETRY_VERSION} && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy only the necessary files for dependency installation

COPY poetry.lock pyproject.toml ./

# Install only main (production) dependencies into the .venv directory

RUN poetry install --only main --sync --no-root -vvv

# ---- Final Stage ----
FROM builder as final

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    APP_VENV="/opt/venv" 

WORKDIR /app

# Copy the pre-built virtual environment from the builder stage
COPY --from=builder /app/.venv ${APP_VENV}

# Copy your application code.
# Because of .dockerignore, only necessary files will be copied by "COPY . ."
# This assumes your Dockerfile is in the root of your project,
# and your microservice name folder is a module/package in that root.
COPY . .

# Activate the virtual environment by adding its bin directory to PATH
ENV PATH="${APP_VENV}/bin:$PATH"

EXPOSE 8000

# Your CMD remains largely the same, but now runs from the venv's path implicitly
# The uvicorn here will be the one installed in APP_VENV
CMD uvicorn service_name.main:app --host 0.0.0.0 --port ${PORT:-8000}
