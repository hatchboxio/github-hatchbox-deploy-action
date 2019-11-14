# Honeybadger Notify Deploy Action

Sending deployment notifications to Honeybadger allows your team to associate spikes in errors to changes that were deployed.

#### Inputs

Use these inputs to customise the action.

Input Name | Default | Required? | Description
------------ | ------------- | ------------ | -------------
api_key | N/A | Y | The Honeybadger project API key
environment | production | N | The deployment environment
endpoint | https://api.honeybadger.io/v1/deploys | N | The deploy submission endpoint. Only used for testing
