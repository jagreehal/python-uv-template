# Python UV Template

This project provides a template for Python development using uv.

## Getting Started

1. Clone this repository:

   ```bash
   git clone https://github.com/jagreehal/python-uv-template.git
   cd python-uv-template
   ```

2. Set up the virtual environment and install dependencies using uv:

   ```bash
   make install
   ```

   This command uses uv to create and manage the virtual environment and install all project dependencies, including development dependencies.

3. Activate the virtual environment:

   No need to manually activate the virtual environment, as uv manages that automatically when running commands. If you do need to manually activate the environment, you can do so like this:

- On Unix or MacOS:

  ```bash
  source .venv/bin/activate
  ```

- On Windows:

- ```bash
  .venv\Scripts\activate
  ```

## Available Make Commands

This project uses a Makefile to simplify common development tasks. Here's an overview of available commands:

- make install: Sets up the virtual environment and installs all dependencies using uv.
- make lint: Runs the linter (ruff) to check your code for potential issues.
- make format: Formats your code using ruff and black.
- make test: Runs your tests using pytest.
- make type-check: Runs the type checker (mypy) on your code.
- make update-deps: Updates the project dependencies.
- make clean: Removes the virtual environment and cleans up cache files.
- make all: Runs install, lint, format, test, and type-check in sequence.

## Development Workflow

1. Make changes to your code.

2. Run linter and formatter:

   ```bash
   make lint
   make format
   ```

3. Run tests:

   ```bash
   make test
   ```

4. Check types:

   ```bash
   make type-check
   ```

5. Before committing, you can run all checks:

   ```bash
   make all
   ```

## Cleaning the Environment

To remove the virtual environment and clean up cache files, use:

```bash
make clean
```

## License

This project is licensed under the MIT License
