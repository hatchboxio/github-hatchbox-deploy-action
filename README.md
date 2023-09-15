# Hatchbox.io Deploy Action

Trigger Hatchbox.io app deployments.

For Hatchbox Classic users, see [v1]().

#### Inputs

Use these inputs to customise the action.

Input Name | Default | Required? | Description
------------ | ------------- | ------------ | -------------
deploy_key | N/A | Y | Your Hatchbox.io app's Deploy Key.
sha | ${{ github.sha }} | N | The commit sha to deploy. Default's to the sha that triggered the GitHub Action.

## Usage

Set `HATCHBOX_DEPLOY_KEY` in your GitHub Secrets. You can find the Deploy Key in the URL on the App's Repository tab in Hatchbox.io.

#### Example

```yaml
# .github/workflows/deploy.yml
on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: hatchboxio/github-hatchbox-deploy-action@v2
      with:
        deploy_key: ${{ secrets.HATCHBOX_DEPLOY_KEY }}
```
