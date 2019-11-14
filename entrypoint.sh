#!/bin/sh -l

curl \
  $INPUT_ENDPOINT \
  -F api_key=$INPUT_API_KEY \
  -F deploy[environment]=$INPUT_ENVIRONMENT \
  -F deploy[local_username]=$GITHUB_ACTOR \
  -F deploy[revision]=$GITHUB_SHA \
  -F deploy[repository]=$GITHUB_REPOSITORY
