export VIRTUAL_ENV := $(PWD)/.venv
export PATH := $(PWD)/.venv/bin:$(PATH)

PYTHON := python3.12

.PHONY: build

.venv:
	@$(PYTHON) -m venv $(VIRTUAL_ENV)
	pip install --upgrade pip

install: .venv ## Create .venv and install dependencies.
	@pip install mkdocs==1.6.1

start:
	@mkdocs serve

build:
	@rm -rf docs/*
	@mkdocs build
	@mv site/* docs
	@rm -rf site