#!/bin/bash
echo "Deploying API Configurations..."

# Deploy KVMs
apigeecli kvms create --org my-apigee-org --env test --name my-kvm --body config/kvm.json --token "$(gcloud auth print-access-token)"

# Deploy Target Servers
apigeecli targetservers create --org my-apigee-org --env test --name my-target --body config/target-servers.json --token "$(gcloud auth print-access-token)"

# Deploy API Products
apigeecli products create --org my-apigee-org --name my-product --body config/products.json --token "$(gcloud auth print-access-token)"

echo "API Configurations Deployed!"
