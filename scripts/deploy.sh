#!/bin/bash

set -e

echo "🚀 Deploying API Proxy..."
cd apiproxies/my-proxy
mvn clean install -Pdeploy -Dapigee.config.file=../../config/apigee-config.json
cd -

echo "🚀 Deploying Shared Flow..."
cd sharedflows/my-shared-flow
mvn clean install -Pdeploy
cd -

echo "✅ Deployment complete."
