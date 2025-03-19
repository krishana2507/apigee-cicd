#!/bin/bash
echo "Rolling back to previous stable version..."

# Fetch latest stable revision
LAST_REVISION=$(apigeecli apis get --org my-apigee-org --name my-proxy --token "$(gcloud auth print-access-token)" | jq -r '.revision[-2]')

# Deploy last stable revision
apigeecli apis deploy --org my-apigee-org --env test --name my-proxy --revision $LAST_REVISION --token "$(gcloud auth print-access-token)"

echo "Rollback to revision $LAST_REVISION completed!"
