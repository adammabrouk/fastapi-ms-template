# Use a base image that supports Docker-in-Docker
FROM docker:20.10.7-dind

# Install Docker and other necessary dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-setuptools \
    py3-wheel \
    py3-virtualenv \
    py3-poetry \
    docker-cli \
    docker-compose

# Set environment variables
ENV POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1

# Copy pyproject.toml and poetry.lock files
WORKDIR /workspace
COPY pyproject.toml poetry.lock ./

# Install all dependencies including dev dependencies
RUN poetry install

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 8000

# Command to run the application
CMD ["uvicorn", "_service_name.main:app", "--host", "0.0.0.0", "--port", "8000"]
