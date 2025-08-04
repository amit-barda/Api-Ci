# API CI Makefile

.PHONY: help test test-local test-staging test-prod test-all clean setup

help:
	@echo "Commands:"
	@echo "  setup      - Install dependencies"
	@echo "  test-local - Run local tests"
	@echo "  test-all   - Run all tests"
	@echo "  clean      - Clean reports"

setup:
	npm install
	npm install -g newman

test-local:
	./scripts/run_tests.sh local

test-staging:
	./scripts/run_tests.sh staging

test-prod:
	./scripts/run_tests.sh production

test-all:
	./scripts/run_tests.sh all

clean:
	rm -f reports/*.html reports/*.json 