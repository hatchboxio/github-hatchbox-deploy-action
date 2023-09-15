#!/bin/sh -l

# print commands and exit on failure
set -xe

if [[ $INPUT_CLASSIC == "true" ]]; then
  url="https://classic.hatchbox.io/webhooks/custom/push/$INPUT_DEPLOY_KEY?ref=refs%2Fheads%2F$INPUT_BRANCH"
else
  url="https://app.hatchbox.io/webhooks/deployments/$INPUT_DEPLOY_KEY?sha=$INPUT_SHA"
fi

curl -X POST --fail $url
echo "Success"
