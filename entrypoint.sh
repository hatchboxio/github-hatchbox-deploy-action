#!/bin/sh -l

set -x 

if [[ $INPUT_CLASSIC == "true" ]]; then
  url="https://classic.hatchbox.io/webhooks/custom/push/$INPUT_DEPLOY_KEY?ref=refs%2Fheads%2F$INPUT_BRANCH"
else
  url="https://app.hatchbox.io/webhooks/deployments/$INPUT_DEPLOY_KEY?latest=true"
fi

curl --fail $url
echo "Success"
