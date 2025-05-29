.DEFAULT_GOAL := help

.PHONY: help install install-extras lint lint-fix format test type-check update-deps clean check-env security-check watch-file watch-test test-watch reinstall check coverage requirements venv doctor

help: ## Show this help message and exit
	@echo "\033[1;34mAvailable commands:\033[0m"
	@grep -E '^[a-zA-Z_-]+:.*?## ' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

# Use Python 3.12
PYTHON := python3.12
VENV := .venv

# Set BIN and UV variables based on operating system
ifeq ($(OS),Windows_NT)
    BIN := $(VENV)/Scripts
    UV := $(BIN)/uv.exe
else
    BIN := $(VENV)/bin
    UV := $(BIN)/uv
endif

install: ## Create venv and install all dependencies
	@echo "\033[1;32mInstalling dependencies using uv...\033[0m"
	@uv venv
	@uv pip install -e ".[dev]"
	@echo "\033[1;32mDependencies installed.\033[0m"

install-extras: ## Install optional logging and debug extras
	@echo "\033[1;32mInstalling extras using uv...\033[0m"; \
	$(UV) pip install -e ".[logging,debug]"; \
	echo "\033[1;32mExtras installed.\033[0m"

lint: ## Run ruff linter
	@echo "\033[1;34mRunning linter...\033[0m"
	@uv run ruff check .

lint-fix: ## Auto-fix lint issues
	@echo "\033[1;34mFixing lint issues...\033[0m"
	@uv run ruff check --fix --unsafe-fixes .
	@echo "\033[1;32mLint issues fixed.\033[0m"

format: ## Format code and fix lint issues
	@echo "\033[1;34mFormatting code...\033[0m"
	@uv run ruff check --fix --unsafe-fixes .
	@uv run ruff format .

venv: ## Create virtual environment only
	@uv venv

requirements: ## Export requirements.txt from lock file
	@uv pip freeze > requirements.txt
	@echo "\033[1;32mrequirements.txt generated.\033[0m"

reinstall: clean install ## Remove venv and reinstall everything

check: format lint type-check test security-check ## Run all checks

coverage: test ## Open HTML coverage report
	@open htmlcov/index.html || xdg-open htmlcov/index.html || echo "Coverage report at htmlcov/index.html"

test: ## Run tests with coverage
	@echo "\033[1;34mRunning tests...\033[0m"
	@uv run pytest --cov=src --cov-report=xml --cov-report=term-missing --cov-report=html

test-watch: ## Run tests in watch mode (requires file=...)
	@echo "\033[1;34mRunning tests in watch mode...\033[0m"
	@uv run pytest-watch -- --cov=src --cov-report=term-missing

type-check: ## Run mypy type checker
	@echo "\033[1;34mRunning type checker...\033[0m"
	@uv run mypy .

security-check: ## Run bandit security checks
	@echo "\033[1;34mRunning security checks...\033[0m"
	@uv run bandit -r src/ --exclude src/test_*.py
	@echo "\033[1;32mSecurity checks complete.\033[0m"

update-deps: ## Update dependencies and lock file
	@echo "\033[1;34mUpdating dependencies using uv...\033[0m"
	@uv pip compile --upgrade
	@git diff uv.lock || true
	@uv pip install -e ".[dev]"
	@echo "\033[1;32mDependencies and lock file updated with uv.\033[0m"
	@echo "If you want to allow newer versions, update the version constraints in pyproject.toml."

check-env: ## Check required environment variables
	@echo "\033[1;34mChecking required environment variables...\033[0m"
	@if [ -z "$(DATABASE_URL)" ]; then echo "\033[1;31mDATABASE_URL is not set!\033[0m"; exit 1; fi
	@if [ -z "$(SECRET_KEY)" ]; then echo "\033[1;31mSECRET_KEY is not set!\033[0m"; exit 1; fi
	@echo "\033[1;32mAll required environment variables are set.\033[0m"

clean: ## Remove venv and cache files
	@echo "\033[1;34mCleaning up virtual environment and cache...\033[0m"
	@rm -rf $(VENV)  # Remove the virtual environment
	@find . -type d -name "__pycache__" -exec rm -rf {} +
	@find . -type f -name "*.py[co]" -delete
	@echo "\033[1;32mCleaned up environment and cache files.\033[0m"

watch-file: ## Watch a file for changes and run it (requires file=...)
	@if [ -z "$(file)" ]; then \
		echo "\033[1;31mUsage: make watch-file file=<file_path>\033[0m"; \
		exit 1; \
	fi; \
	echo "\033[1;34mWatching file: $(file) for changes...\033[0m"; \
	$(BIN)/watchmedo shell-command \
		--patterns="$(file)" \
		--recursive \
		--command='echo "File $(file) changed! Running action..."; $(BIN)/python $(file)' \
		.

watch-test: ## Watch a test file for changes and run tests (requires file=...)
	@if [ -z "$(file)" ]; then \
		echo "\033[1;31mUsage: make watch-test file=<test_file_path>\033[0m"; \
		exit 1; \
	fi; \
	echo "\033[1;34mWatching test file: $(file) for changes...\033[0m"; \
	$(BIN)/watchmedo shell-command \
		--patterns="$(file)" \
		--recursive \
		--command='echo "Test file $(file) changed! Running tests..."; $(BIN)/pytest $(file)' \
		.

doctor: ## Check for common environment issues
	@echo "\033[1;34mPython version:\033[0m"; python3 --version
	@echo "\033[1;34muv version:\033[0m"; uv --version || echo "uv not installed"
	@echo "\033[1;34mVirtual environment exists?\033[0m"; [ -d $(VENV) ] && echo "Yes" || echo "No"
	@echo "\033[1;34mChecking for .env file...\033[0m"; [ -f .env ] && echo ".env found" || echo ".env missing"

all: check ## Run all checks (alias for check)
