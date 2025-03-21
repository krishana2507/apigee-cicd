#!/bin/bash

set -e

ORG="${APIGEE_ORG}"
ENV="${APIGEE_ENV}"
SA_KEY_PATH="gcp-key.json"

echo "🔧 Deploying KVMs..."
apigeecli kvms create --env "$ENV" --org "$ORG" --file ./config/kvm.json --cred "$SA_KEY_PATH" --token ""

echo "🔧 Deploying Target Servers..."
apigeecli targetservers create --env "$ENV" --org "$ORG" --file ./config/target-servers.json --cred "$SA_KEY_PATH" --token ""

echo "🔧 Deploying API Products..."
apigeecli products create --org "$ORG" --file ./config/product.json --cred "$SA_KEY_PATH" --token ""

echo "✅ Config deployment completed."
