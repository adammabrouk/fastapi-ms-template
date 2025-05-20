# FastAPI Microservice Template

## Introduction

This repository provides a robust and professional template for creating FastAPI-based microservices. It is designed to help developers quickly set up a new project with a well-structured codebase, integrated CI pipeline, and a development container for a seamless development experience.

## Advantages

- **Quick Setup**: Get started with a new FastAPI project in minutes.
- **Structured Codebase**: Follow best practices with a well-organized project structure.
- **Integrated CI**: Automated testing and linting with GitHub Actions.
- **Devcontainer Support**: Develop in a consistent environment with Visual Studio Code's devcontainer feature / Usable also in Github Codespaces.
- **Dependency Management**: Use Poetry for managing dependencies and virtual environments.
- **Docker Support**: Easily containerize your application for development and production.

## CI Pipeline

This template includes a comprehensive CI pipeline using GitHub Actions. The pipeline is configured to:

1. **Build and Push Devcontainer**: Build and push the development container to GitHub Container Registry.
2. **Lint Code**: Run linters to ensure code quality and consistency.
3. **Run Tests**: Execute tests to verify the functionality of the application.

The CI pipeline ensures that your code is always in a deployable state and helps catch issues early in the development process.

## Devcontainer Setup

The template includes a devcontainer configuration for Visual Studio Code, allowing developers to quickly spin up a development environment. The devcontainer setup provides:

- **Consistent Development Environment**: Ensure all developers work in the same environment, reducing "it works on my machine" issues.
- **Pre-configured Tools**: Includes essential tools and extensions for Python development.
- **Easy Setup**: Simply open the project in Visual Studio Code / Or Github Codespaces and start coding.

The devcontainer setup leverages Docker to create an isolated development environment, making it easy to manage dependencies and tools.

## Getting Started

To get started with this template, follow these steps:

1. Create a Repository from this template on GitHub.
 
2. Modify the service name in `pyproject.yaml` and the folder name `service_name` to reflect your microservice name.

3. Open the project in Visual Studio Code and start the devcontainer / or create a codespace in Github from branch main.

4. Start developing your FastAPI microservice!

## Conclusion

This FastAPI Microservice Template provides a solid foundation for building scalable and maintainable microservices. With its integrated CI pipeline and devcontainer support, you can focus on writing code and delivering value to your users. Happy coding!
