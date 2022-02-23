#!/bin/sh -l

if [[ $INPUT_CLASSIC == "true" ]]; then
  subdomain="classic"
else
  subdomain="app"
fi

echo "https://$subdomain.hatchbox.io/webhooks/custom/push/$INPUT_DEPLOY_KEY?ref=refs%2Fheads%2F$INPUT_BRANCH"

result=$(curl https://$subdomain.hatchbox.io/webhooks/custom/push/$INPUT_DEPLOY_KEY?ref=refs%2Fheads%2F$INPUT_BRANCH)

echo "$result"

if [[ $(expr match "$result" '"\"success\":true"') != 0 ]]; then
  echo "Success"
  exit 0
else
  echo "Failed"
  exit 1
fi

