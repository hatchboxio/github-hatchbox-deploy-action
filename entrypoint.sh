#!/bin/sh -l

set -xe

curl -X POST --fail-with-body "https://app.hatchbox.io/webhooks/deployments/$INPUT_DEPLOY_KEY?sha=$INPUT_SHA"
echo "Deployment has started on Hatchbox.io"
