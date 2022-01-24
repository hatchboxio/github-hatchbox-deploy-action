#!/bin/sh -l

if [[ $INPUT_CLASSIC == "true" ]]; then
  url_start="classic"
else
  url_start="www"
fi

echo "https://$url_start.hatchbox.io/webhooks/custom/push/$INPUT_DEPLOY_KEY?ref=refs%2Fheads%2F$INPUT_BRANCH"

result=$(curl https://$url_start.hatchbox.io/webhooks/custom/push/$INPUT_DEPLOY_KEY?ref=refs%2Fheads%2F$INPUT_BRANCH)

echo "$result"

if [[ $result =~ "\"success\":true" ]]; then
  echo "Success"
  exit 0
else
  echo "Failed"
  exit 1
fi

