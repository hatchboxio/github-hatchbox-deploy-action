# Honeybadger Notify Deploy Action

Sending deployment notifications to Honeybadger allows your team to associate spikes in errors to changes that were deployed.

#### Inputs

Use these inputs to customise the action.

Input Name | Default | Required? | Description
------------ | ------------- | ------------ | -------------
api_key | N/A | Y | The Honeybadger project API key
environment | production | N | The deployment environment
endpoint | https://api.honeybadger.io/v1/deploys | N | The deploy submission endpoint. Only used for testing

#### Example

```yaml
on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: honeybadger-io/github-notify-deploy-action@master
      with:
        api_key: ${{ secrets.HONEYBADGER_API_KEY }}
```
