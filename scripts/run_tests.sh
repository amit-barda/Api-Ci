#!/bin/bash

# API test runner

set -e

# Run tests
run_tests() {
    local env=$1
    echo "Running tests for $env..."
    
    newman run collections/api-tests.json \
        -e environments/$env.json \
        -r html,json \
        --reporter-html-export reports/report.html \
        --reporter-json-export reports/report.json
}

# Main
env=${1:-local}

case $env in
    local|staging|production)
        run_tests $env
        ;;
    all)
        run_tests local
        run_tests staging
        run_tests production
        ;;
    *)
        echo "Usage: $0 [local|staging|production|all]"
        exit 1
        ;;
esac

echo "Done." 