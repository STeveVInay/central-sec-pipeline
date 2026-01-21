#!/bin/bash

# The target repo path is passed as argument
REPO_PATH=$1

echo "Starting secret scan on repo: $REPO_PATH"

# Example: using gitleaks for secret scanning
# Install gitleaks if not present (for runner)
if ! command -v gitleaks &> /dev/null
then
    echo "Gitleaks not found, installing..."
    curl -sSfL https://raw.githubusercontent.com/gitleaks/gitleaks/master/install.sh | sh
fi

# Run gitleaks scan
gitleaks detect --source "$REPO_PATH" --report-format json --report-path leaks.json

echo "Secret scan completed. Report saved at leaks.json"

