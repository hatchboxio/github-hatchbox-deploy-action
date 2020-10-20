#!/bin/sh -l

curl -sS \
  https://www.hatchbox.io/webhooks/custom/push/$INPUT_DEPLOY_KEY?ref=refs%2Fheads%2F$INPUT_BRANCH
