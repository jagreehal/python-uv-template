.PHONY: install lint format test type-check update-deps clean watch-file watch-test

# Use Python 3.12
PYTHON := python3.12
VENV := .venv
BIN := $(VENV)/bin

install:
	@if [ ! -d "$(VENV)" ]; then \
		echo "Virtual environment not found, creating..."; \
		$(PYTHON) -m venv $(VENV); \
		echo "Virtual environment created."; \
		echo "Please activate the virtual environment before proceeding with installation:"; \
		echo "  source $(VENV)/bin/activate"; \
	else \
		if [ -z "$$VIRTUAL_ENV" ]; then \
			echo "Virtual environment exists but is not activated."; \
			echo "Please activate the virtual environment first:"; \
			echo "  source $(VENV)/bin/activate"; \
			exit 1; \
		fi; \
	fi

	# Check if uv is installed; if not, install it
	@if [ ! -f "$(UV)" ]; then \
		echo "uv not found, installing it..."; \
		$(VENV)/bin/pip install uv; \
	fi

	# Install dependencies using uv
	@echo "Installing dependencies using uv..."; \
	$(UV) pip install -e ".[dev]"; \
	echo "Dependencies installed."

lint:
	@echo "Running linter..."
	@uv run ruff check .

format:
	@echo "Formatting code..."
	@uv run ruff check --fix .
	@uv run ruff format .

test:
	@echo "Running tests..."
	@uv run pytest

type-check:
	@echo "Running type checker..."
	@uv run mypy .

update-deps:
	@echo "Updating dependencies using uv..."
	@uv pip install --upgrade -e ".[dev]"
	@echo "Dependencies updated with uv."

clean:
	@echo "Cleaning up virtual environment and cache..."
	@rm -rf $(VENV)  # Remove the virtual environment
	@find . -type d -name "__pycache__" -exec rm -rf {} +
	@find . -type f -name "*.py[co]" -delete
	@echo "Cleaned up environment and cache files."

watch-file:
	@if [ -z "$(file)" ]; then \
		echo "Usage: make watch-file file=<file_path>"; \
		exit 1; \
	fi; \
	echo "Watching file: $(file) for changes..."; \
	$(BIN)/watchmedo shell-command \
		--patterns="$(file)" \
		--recursive \
		--command='echo "File $(file) changed! Running action..."; $(BIN)/python $(file)' \
		.

watch-test:
	@if [ -z "$(file)" ]; then \
		echo "Usage: make watch-test file=<test_file_path>"; \
		exit 1; \
	fi; \
	echo "Watching test file: $(file) for changes..."; \
	$(BIN)/watchmedo shell-command \
		--patterns="$(file)" \
		--recursive \
		--command='echo "Test file $(file) changed! Running tests..."; $(BIN)/pytest $(file)' \
		.

# Default target
all: install lint format test type-check update-deps
