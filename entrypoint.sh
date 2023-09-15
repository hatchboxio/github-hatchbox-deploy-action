#!/bin/sh -l

set -xe

response=$(curl -X POST --fail-with-body "https://app.hatchbox.io/webhooks/deployments/$INPUT_DEPLOY_KEY?sha=$INPUT_SHA")
echo "response=$response" >> $GITHUB_OUTPUT
echo "Deployment has started on Hatchbox.io"
