#!/bin/bash

set -e

ORG="${APIGEE_ORG}"
ENV="${APIGEE_ENV}"
PROXY_NAME="my-proxy"
SHAREDFLOW_NAME="my-shared-flow"
SA_KEY_PATH="gcp-key.json"

echo "⚠️ Rolling back last deployment..."

# Example: Undeploy proxy (if deployed)
REVISION=$(apigeecli apis get --org "$ORG" --name "$PROXY_NAME" --cred "$SA_KEY_PATH" --token "" --out json | jq -r '.revision[-2]')
apigeecli apis deploy --name "$PROXY_NAME" --org "$ORG" --env "$ENV" --rev "$REVISION" --override --cred "$SA_KEY_PATH" --token ""

# Add rollback for shared flow or configs if needed

echo "✅ Rollback complete."
