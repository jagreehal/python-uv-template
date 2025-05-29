# Python UV Template

[![CI Status](https://github.com/jagreehal/python-uv-template/actions/workflows/ci.yml/badge.svg)](https://github.com/jagreehal/python-uv-template/actions)
[![Python Version](https://img.shields.io/badge/python-3.12-blue.svg)](https://www.python.org/downloads/)
[![Code style: ruff](https://img.shields.io/badge/code%20style-ruff-000000.svg)](https://github.com/astral-sh/ruff)
[![Type Checker: mypy](https://img.shields.io/badge/type%20checker-mypy-blue.svg)](https://github.com/python/mypy)
[![Security: bandit](https://img.shields.io/badge/security-bandit-yellow.svg)](https://github.com/PyCQA/bandit)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Dependency Manager: uv](https://img.shields.io/badge/dependency%20manager-uv-purple.svg)](https://github.com/astral-sh/uv)

A production-ready Python project template powered by modern tools and best practices. Built around [uv](https://github.com/astral-sh/uv), the blazingly fast Python package installer and resolver, this template streamlines Python development with:

- **Lightning-Fast Dependency Management**: Uses `uv` for up to 10x faster package operations than pip
- **Zero-Config Quality Tools**: Pre-configured Ruff, MyPy, and Pytest setup works out of the box
- **Automated Quality Checks**: Git hooks and CI/CD pipeline ensure code quality on every push
- **Developer Experience First**: Watch mode, Jupyter support, and comprehensive Makefile for smooth development
- **Production Best Practices**: Type hints, error handling, test coverage, and security checks built-in
- **Modern Python Standards**: Leverages Python 3.12+ features and current industry best practices

Perfect for both new projects and as a reference for modernizing existing Python codebases. Whether you're building APIs, CLI tools, or data science applications, this template provides a solid foundation with minimal setup.

## Features

- 🚀 Fast dependency management with `uv`
- 🔍 Code quality tools pre-configured:
  - [Ruff](https://github.com/astral-sh/ruff) for lightning-fast linting and formatting
  - [MyPy](https://mypy.readthedocs.io/) for static type checking
  - [Pytest](https://docs.pytest.org/) with async and mock support
  - [Bandit](https://github.com/PyCQA/bandit) for security checks
- 📦 Modern project structure with `pyproject.toml`
- 🔄 GitHub Actions CI pipeline with merge checks
- 📝 Jupyter Notebook support
- 👀 File watching for development
- 🛠️ Makefile for common tasks
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

3. Install logging and debugging extras (optional):

   ```bash
   make install-extras
   ```

## Usage Examples

### Discover All Commands

```bash
make           # Shows all available commands with descriptions (colorized)
make help      # Same as above
```

### Basic Development Workflow

```bash
# Start development
make install
# Format and lint your code
make format
make lint
# Run tests
make test
# Run all checks (format, lint, type-check, test, security)
make check
# Watch a file during development
make watch-file file=src/main.py
```

### Test-Driven Development (TDD)

```bash
# Create a new test file
touch src/test_divide.py
# Watch tests during development
make test-watch file=src/test_divide.py
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
make check
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

### Other Useful Commands

```bash
make reinstall         # Clean and reinstall everything
make requirements      # Export requirements.txt from lock file
make venv              # Create the virtual environment only
make coverage          # Open the HTML coverage report
make doctor            # Diagnose common environment issues
```

## Development Commands

| Command                                    | Description                            | When to Use                                                |
| ------------------------------------------ | -------------------------------------- | ---------------------------------------------------------- |
| `make` or `make help`                      | Show all available commands            | Anytime you need to see available tasks                    |
| `make install`                             | Install dependencies                   | Initial setup and after pulling changes                    |
| `make install-extras`                      | Install optional packages              | When you need logging (loguru) or debugging (icecream)     |
| `make format`                              | Format code and fix lint issues        | Before creating a pull request                             |
| `make lint`                                | Check code with ruff                   | To verify code quality locally                             |
| `make lint-fix`                            | Auto-fix linting issues                | To automatically fix style issues                          |
| `make test`                                | Run tests with coverage                | After making changes (generates coverage reports)          |
| `make test-watch file=src/test_example.py` | Auto-run tests on changes              | During TDD (replace test_example.py with target test file) |
| `make type-check`                          | Run MyPy type checker                  | To verify type safety locally                              |
| `make security-check`                      | Run security audit                     | Before deployments                                         |
| `make update-deps`                         | Update dependencies and lock file      | When you want to upgrade packages                          |
| `make check-env`                           | Verify environment variables           | Before running the application                             |
| `make watch-file file=src/your_script.py`  | Auto-run file on changes               | During active development                                  |
| `make clean`                               | Remove generated files                 | To start fresh                                             |
| `make all` or `make check`                 | Run complete pipeline (all checks)     | To verify all checks locally                               |
| `make reinstall`                           | Clean and reinstall everything         | If your environment is broken                              |
| `make requirements`                        | Export requirements.txt from lock file | For tools that need requirements.txt                       |
| `make venv`                                | Create the virtual environment only    | If you want to just create the venv                        |
| `make coverage`                            | Open HTML coverage report              | To view test coverage in browser                           |
| `make doctor`                              | Diagnose common environment issues     | To check Python, uv, venv, and .env status                 |

### Watch Commands Examples

```bash
# Watch and run a specific Python file
make watch-file file=src/main.py
# Watch and run a specific test file
make watch-test file=src/test_divide.py
# Watch multiple files (use appropriate glob pattern)
make watch-file file=src/*.py
```

## Quality Assurance

This template follows a "commit early, commit often" philosophy while maintaining code quality through CI/CD:

### Local Development

- Developers can commit and push freely to feature branches
- Local quality tools are available but not enforced:

  ```bash
  make format  # Format when ready
  make lint    # Check for issues
  make test    # Run tests
  ```

- Use `make check` or `make all` to run all checks locally before creating a PR

### CI/CD Pipeline

The template includes a robust GitHub Actions workflow that:

1. Triggers on:

   - Pull requests to main
   - Push to main

2. Performs automated checks:

   - Dependency installation
   - Code formatting verification
   - Linting
   - Type checking
   - Test coverage
   - Security scanning

3. Merge Protection:
   - All checks must pass before merging to main
   - Code review required (configurable)
   - Up-to-date branch required

This approach ensures:

- Developers can work freely on their branches
- Code quality is maintained at the repository level
- Main branch always contains verified code
- No interruption to local development workflow

## Project Structure

```
.
├── src/                           # Source code directory
│   ├── divide.py                  # Division logic with error handling
│   ├── main.py                    # Main application entry point
│   └── test_divide.py             # Tests with pytest examples
├── .github/                       # GitHub Actions workflows
│   └── workflows/
│       └── ci.yml                 # CI pipeline configuration
├── pyproject.toml                 # Project configuration and dependencies
├── Makefile                       # Development automation
├── README.md                      # Project documentation
├── LICENSE                        # MIT License
├── example.ipynb                  # Example Jupyter notebook
└── uv.lock                        # Lock file for dependencies
# Generated directories (not in repository)
├── .venv/                         # Virtual environment (generated)
├── htmlcov/                       # Test coverage reports (generated)
├── .mypy_cache/                   # Type checking cache (generated)
└── .pytest_cache/                 # Pytest cache (generated)
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
- `pytest-asyncio`: For testing async code
- `pytest-mock`: For mocking in tests
- `pre-commit`: For git hooks
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
