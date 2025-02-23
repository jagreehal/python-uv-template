# Python UV Template

[![CI Status](https://github.com/jagreehal/python-uv-template/actions/workflows/ci.yml/badge.svg)](https://github.com/jagreehal/python-uv-template/actions)
[![codecov](https://codecov.io/gh/jagreehal/python-uv-template/branch/main/graph/badge.svg)](https://codecov.io/gh/jagreehal/python-uv-template)
[![Python Version](https://img.shields.io/badge/python-3.12-blue.svg)](https://www.python.org/downloads/)
[![Code style: ruff](https://img.shields.io/badge/code%20style-ruff-000000.svg)](https://github.com/astral-sh/ruff)
[![Type Checker: mypy](https://img.shields.io/badge/type%20checker-mypy-blue.svg)](https://github.com/python/mypy)
[![Security: bandit](https://img.shields.io/badge/security-bandit-yellow.svg)](https://github.com/PyCQA/bandit)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Dependency Manager: uv](https://img.shields.io/badge/dependency%20manager-uv-purple.svg)](https://github.com/astral-sh/uv)

A modern Python project template using [uv](https://github.com/astral-sh/uv) for fast, reliable dependency management. This template provides a production-ready setup with best practices for Python development.

## Features

- 🚀 Fast dependency management with `uv`
- 🔍 Code quality tools pre-configured:
  - [Ruff](https://github.com/astral-sh/ruff) for lightning-fast linting and formatting
  - [MyPy](https://mypy.readthedocs.io/) for static type checking
  - [Pytest](https://docs.pytest.org/) for testing with coverage reporting
  - [Bandit](https://github.com/PyCQA/bandit) for security checks
- 📦 Modern project structure with `pyproject.toml`
- 🔄 GitHub Actions CI pipeline with Codecov integration
- 🔒 Git pre-push hooks for quality assurance
- 📝 Jupyter Notebook support
- 👀 File watching for development
- 🛠️ Comprehensive Makefile for common tasks
- 🎯 Example code demonstrating Python best practices:
  - Type hints and Pydantic models
  - Custom exception handling
  - Comprehensive test coverage
  - Clear documentation

## Prerequisites

- Python 3.12 or higher
- uv package installer:

  ```bash
  pip install uv
  ```

- (Optional) Codecov token for coverage reporting

## Quick Start

1. Use this template:

   ```bash
   git clone https://github.com/jagreehal/python-uv-template.git my-project
   cd my-project
   ```

2. Install dependencies:

   ```bash
   make install
   ```

3. (Optional) Configure Codecov:

   - Sign up at [Codecov](https://codecov.io) with your GitHub account
   - Add your repository to Codecov
   - Get your repository upload token
   - Add the token to your GitHub repository:
     ```bash
     # In your GitHub repository:
     # Settings -> Secrets and variables -> Actions
     # Add new repository secret:
     # Name: CODECOV_TOKEN
     # Value: your-codecov-token
     ```

4. (Optional) Install logging and debugging extras:

   ```bash
   make install-extras
   ```

## Usage Examples

### Basic Development Workflow

```bash
# Start development
make install

# Format and lint your code
make format
make lint

# Run tests
make test

# Watch a file during development
make watch-file file=src/main.py
```

### Test-Driven Development (TDD)

```bash
# Create a new test file
touch src/test_divide.py

# Watch tests during development
make watch-test file=src/test_divide.py

# Run all tests with coverage
make test
```

### Code Quality Checks

```bash
# Run all checks before committing
make format
make lint
make type-check
make security-check

# Or run everything at once
make all
```

### Environment Setup

```bash
# Create a .env file
echo "DATABASE_URL=postgresql://localhost:5432/db" > .env
echo "SECRET_KEY=your-secret-key" >> .env

# Verify environment
make check-env
```

### Dependency Management

```bash
# Install new dependencies
# 1. Add to pyproject.toml
# 2. Update environment
make update-deps

# Install optional extras
make install-extras
```

## Development Commands

| Command                                    | Description                     | When to Use                                                         |
| ------------------------------------------ | ------------------------------- | ------------------------------------------------------------------- |
| `make install`                             | Install dependencies            | Initial setup and after pulling changes                             |
| `make install-extras`                      | Install optional packages       | When you need logging (loguru) or debugging (icecream)              |
| `make format`                              | Format code and fix lint issues | Before committing changes                                           |
| `make lint`                                | Check code with ruff            | To verify code quality                                              |
| `make lint-fix`                            | Auto-fix linting issues         | To automatically fix style issues                                   |
| `make test`                                | Run tests with coverage         | After making changes (generates coverage reports)                   |
| `make type-check`                          | Run MyPy type checker           | To verify type safety                                               |
| `make security-check`                      | Run security audit              | Before deployments                                                  |
| `make update-deps`                         | Update dependencies             | When you want to upgrade packages                                   |
| `make check-env`                           | Verify environment variables    | Before running the application                                      |
| `make watch-file file=src/your_script.py`  | Auto-run file on changes        | During active development (replace your_script.py with target file) |
| `make watch-test file=src/test_example.py` | Auto-run tests on changes       | During TDD (replace test_example.py with target test file)          |
| `make clean`                               | Remove generated files          | To start fresh                                                      |
| `make all`                                 | Run complete pipeline           | Before pushing changes                                              |

### Watch Commands Examples

```bash
# Watch and run a specific Python file
make watch-file file=src/main.py

# Watch and run a specific test file
make watch-test file=src/test_divide.py

# Watch multiple files (use appropriate glob pattern)
make watch-file file=src/*.py
```

## Git Hooks

The template includes pre-push hooks that automatically run quality checks before allowing code to be pushed. This ensures that only high-quality code makes it to the repository.

### Pre-Push Checks

The following checks are run automatically before each push:

1. Code formatting (ruff)
2. Linting (ruff)
3. Type checking (mypy)
4. Tests with coverage (pytest)

If any check fails:

- The push will be blocked
- You'll see detailed error messages
- You'll need to fix the issues before pushing

### Hook Installation

The hooks are automatically installed when you clone the repository. They're stored in the `.githooks` directory and configured via:

```bash
git config core.hooksPath .githooks
```

### Skipping Hooks

In rare cases where you need to skip the pre-push hooks (not recommended), you can use:

```bash
git push --no-verify
```

## Code Coverage

This project uses Codecov for tracking code coverage:

- Coverage reports are generated automatically during CI runs
- Coverage data is uploaded to [Codecov](https://codecov.io)
- Coverage badge in README shows current coverage status
- Detailed coverage reports are available on the Codecov dashboard

### Local Coverage Reports

To view coverage locally:

```bash
make test
# Coverage report will be displayed in terminal
# XML report will be generated at coverage.xml
```

## Project Structure

```
.
├── src/                           # Source code directory
│   ├── divide.py                  # Division logic with error handling
│   ├── main.py                    # Main application entry point
│   └── test_divide.py            # Tests with pytest examples
├── .github/                       # GitHub Actions workflows
│   └── workflows/
│       └── ci.yml                # CI pipeline configuration
├── pyproject.toml                # Project configuration and dependencies
├── Makefile                      # Development automation
├── README.md                     # Project documentation
├── LICENSE                       # MIT License
├── example.ipynb                 # Example Jupyter notebook
└── uv.lock                       # Lock file for dependencies

# Generated directories (not in repository)
├── .venv/                        # Virtual environment (generated)
├── htmlcov/                      # Test coverage reports (generated)
├── .mypy_cache/                  # Type checking cache (generated)
└── .pytest_cache/               # Pytest cache (generated)
```

## Example Code

The template includes example code demonstrating Python best practices:

### Type Hints and Pydantic Models

```python
from pydantic import BaseModel

class DivideParams(BaseModel):
    dividend: float
    divisor: float
```

### Custom Exception Handling

```python
class DivisionError(Exception):
    """Custom exception with rich context."""
    def __init__(self, dividend: float, divisor: float, message: str):
        self.dividend = dividend
        self.divisor = divisor
        self.details = {"dividend": dividend, "divisor": divisor}
        super().__init__(message)

def divide(params: DivideParams) -> float:
    """Divide two numbers with proper error handling."""
    if params.divisor == 0:
        raise DivisionError(
            dividend=params.dividend,
            divisor=params.divisor,
            message="Cannot divide by zero"
        )
    return params.dividend / params.divisor
```

### Pytest Testing Examples

```python
def test_division_by_zero():
    with pytest.raises(DivisionError) as exc_info:
        divide(DivideParams(dividend=10, divisor=0))

    assert str(exc_info.value) == "Cannot divide by zero"
    assert exc_info.value.details == {"dividend": 10, "divisor": 0}
```

## Configuration

### Dependencies

The template includes several pre-configured dependencies:

Core:

- `pydantic`: For data validation
- `python-dotenv`: For environment management

Development (installed with `make install`):

- `ruff`: For linting and formatting
- `mypy`: For type checking
- `pytest` & `pytest-cov`: For testing and coverage
- `bandit`: For security checks
- `watchdog`: For file watching
- `ipykernel`: For Jupyter support

Optional (installed with `make install-extras`):

- `loguru`: For better logging
- `icecream`: For debugging

### Environment Variables

The template includes environment variable checking. Create a `.env` file based on your needs. Example variables used in the template:

```bash
DATABASE_URL=your_database_url
SECRET_KEY=your_secret_key
```

Verify your environment setup:

```bash
make check-env
```

### Customising the Template

1. Update `pyproject.toml`:

   - Change project name, version, and description
   - Modify dependencies as needed
   - Adjust tool configurations:
     - Ruff: Linting rules and formatting options
     - MyPy: Type checking strictness
     - Pytest: Test configuration and coverage settings

2. Update CI Pipeline:

   - Modify `.github/workflows/ci.yml` for your needs
   - Add/remove steps as required

3. Extend Makefile:
   - Add custom commands for your workflow
   - Modify existing commands as needed

## Package Documentation

This template integrates several best-in-class Python packages. For detailed documentation and usage guides, visit:

### Core Tools

- [uv](https://github.com/astral-sh/uv) - Fast Python package installer and resolver
- [Ruff](https://github.com/astral-sh/ruff) - Lightning-fast Python linter and formatter
- [MyPy](https://mypy.readthedocs.io/) - Static type checker
- [Pytest](https://docs.pytest.org/) - Testing framework
- [Bandit](https://github.com/PyCQA/bandit) - Security linter

### Data & Configuration

- [Pydantic](https://docs.pydantic.dev/) - Data validation using Python type annotations
- [Python-dotenv](https://github.com/theskumar/python-dotenv) - Environment variable management

### Development Experience

- [Watchdog](https://github.com/gorakhargosh/watchdog) - File system events monitoring
- [IPykernel](https://github.com/ipython/ipykernel) - Jupyter notebook integration

### Optional Utilities

- [Loguru](https://github.com/Delgan/loguru) - User-friendly logging
- [IceCream](https://github.com/gruns/icecream) - Enhanced print debugging

## Troubleshooting

### Common Issues

#### Installation Problems

- **uv Installation Fails**

  ```bash
  # Ensure Python 3.12+ is your default
  python --version
  # If not, install and set Python 3.12
  # Then try installing uv again
  pip install --upgrade pip
  pip install uv
  ```

- **Dependencies Not Found**

  ```bash
  # Reset your environment
  make clean
  make install
  ```

#### Environment Issues

- **Environment Variables Not Found**

  ```bash
  # Check if .env exists
  ls -la .env
  # Create from example if missing
  cp .env.example .env
  # Verify environment
  make check-env
  ```

- **Virtual Environment Problems**

  ```bash
  # Remove and recreate venv
  make clean
  # Ensure no active venv
  deactivate 2>/dev/null || true
  # Reinstall
  make install
  ```

#### Development Issues

- **Linting/Formatting Fails**

  ```bash
  # Update ruff
  make update-deps
  # Try formatting again
  make format
  ```

- **Tests Fail**

  ```bash
  # Run tests with verbose output
  pytest -v
  # Check coverage report
  open htmlcov/index.html
  ```

- **Type Checking Errors**

  ```bash
  # Run mypy with verbose output
  mypy . --verbose
  # Update stub packages if needed
  make update-deps
  ```

### Getting Help

- Check the [uv documentation](https://github.com/astral-sh/uv) for package management issues
- Review [Ruff's documentation](https://github.com/astral-sh/ruff) for linting/formatting help
- Visit [MyPy's documentation](https://mypy.readthedocs.io/) for type checking guidance
- Search [existing issues](https://github.com/jagreehal/python-uv-template/issues) for similar problems

## Contributing

We welcome contributions! Here's how you can help:

### Getting Started

1. Fork the repository
2. Clone your fork:

   ```bash
   git clone https://github.com/your-username/python-uv-template.git
   cd python-uv-template
   ```

3. Create a feature branch:

   ```bash
   git checkout -b feature/your-feature-name
   ```

### Development Process

1. Install development dependencies:

   ```bash
   make install
   ```

2. Make your changes

3. Ensure all checks pass:

   ```bash
   make all
   ```

4. Write tests for new features

### Submitting Changes

1. Update documentation if needed
2. Commit your changes with clear messages
3. Push to your fork
4. Submit a Pull Request with:
   - Clear description of changes
   - Any breaking changes
   - Links to related issues

### Code Style

This project enforces consistent code style using [Ruff](https://github.com/astral-sh/ruff). The configuration can be found in [`pyproject.toml`](./pyproject.toml) under the `[tool.ruff]` section.

Key style rules:

- Line length: 120 characters
- Quote style: Double quotes
- Python version: 3.12+
- Auto-formatting on save recommended

Additional guidelines:

- Use type hints for all functions
- Add docstrings following Google style
- Use custom exceptions for error handling
- Keep functions focused and small
- Add comments for complex logic

For detailed style configuration, see:

```toml
# pyproject.toml
[tool.ruff]
line-length = 120
target-version = "py312"

[tool.ruff.format]
quote-style = "double"
indent-style = "space"
```

### Need Help?

- Check existing issues and PRs
- Open a new issue for discussions

## License

This project is licensed under the MIT License.

## CI/CD Pipeline

This template includes a GitHub Actions workflow that:

1. Runs on push to main and pull requests
2. Performs the following checks:
   - Installs dependencies using uv
   - Runs code formatting and linting
   - Runs type checking
   - Runs tests with coverage
   - Uploads coverage to Codecov (if token is configured)

### CI/CD Configuration

The pipeline is configured in `.github/workflows/ci.yml` and includes:

- Python 3.12 environment
- uv for dependency management
- Ruff for formatting and linting
- MyPy for type checking
- Pytest with coverage reporting
- Codecov integration (optional)

The pipeline is designed to:

- Pass if all code quality checks succeed
- Continue even if Codecov upload fails
- Provide detailed feedback on any issues

### Coverage Reporting

Coverage reporting is handled through:

1. Pytest-cov for generating coverage data
2. Codecov for hosting and visualizing coverage
3. GitHub Actions for automated uploads

If you don't need Codecov integration:

- The pipeline will still run and pass
- Coverage reports will still be generated locally
- You can remove the Codecov upload step from the workflow
