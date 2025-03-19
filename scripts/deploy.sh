#!/bin/bash
set -e

# Load configurations
PROJECT_ID=$(jq -r '.project_id' config/apigee-config.json)
ORG=$(jq -r '.org' config/apigee-config.json)
ENV=$(jq -r '.env' config/apigee-config.json)

# Authenticate with GCP
echo "$GCP_SA_KEY" > gcp-key.json
gcloud auth activate-service-account --key-file=gcp-key.json

# Deploy API Proxy using Maven
mvn install -Ptest -Dapigee.config.file=config/apigee-config.json

# Deploy configurations using Apigee CLI
apigeecli apis create bundle -o "$ORG" -e "$ENV" -f apiproxies/my-proxy/apiproxy

# Cleanup
rm gcp-key.json
