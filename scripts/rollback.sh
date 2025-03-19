#!/bin/bash
set -e

ORG=$(jq -r '.org' config/apigee-config.json)
ENV=$(jq -r '.env' config/apigee-config.json)

# Rollback last deployment
apigeecli deployments rollback -o "$ORG" -e "$ENV"
