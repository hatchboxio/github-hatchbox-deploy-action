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
    - uses: actions/checkout@v1
    - uses: hatchboxio/github-hatchbox-deploy-action@v1
      with:
        deploy_key: ${{ secrets.HATCHBOX_DEPLOY_KEY }}
```

## Hatchbox Classic

**Hatchbox Classic**

You can find the "deploy key" in the URL on the App's Deploy tab in Hatchbox Classic. For example, it would show:
```
https://www.hatchbox.io/webhooks/github/push/XYZ
```

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
    - uses: actions/checkout@v1
    - uses: hatchboxio/github-hatchbox-deploy-action@v1
      with:
        deploy_key: ${{ secrets.HATCHBOX_DEPLOY_KEY }}
        classic: "true"
        branch: "main"
```