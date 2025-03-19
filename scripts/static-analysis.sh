#!/bin/bash
echo "Running Static Code Analysis..."

# XML Linting for Apigee Policies
find apiproxy/policies/ -name "*.xml" | xargs xmllint --noout

# JavaScript Code Linting
if [ -d "apiproxy/resources/jsc" ]; then
  npm install -g eslint
  eslint apiproxy/resources/jsc/*.js
fi

# Security Checks (Example: OWASP Dependency Check)
mvn org.owasp:dependency-check-maven:check

echo "Static Code Analysis Completed Successfully!"
