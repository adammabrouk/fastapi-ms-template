# Use lightweight Python image
FROM python:3.11-slim

# Set environment variables for Poetry
ENV POETRY_VERSION=2.1.2 \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1

# Install system dependencies and Poetry
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    build-essential \
 && pip install --no-cache-dir poetry==$POETRY_VERSION \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Copy dependency files first (to cache better)
COPY pyproject.toml poetry.lock ./

# Install dependencies
RUN poetry install --no-root

# Copy application code
COPY . .
