# Hatchbox Notify Deploy Action

Sending deployment notifications to Hatchbox.

#### Inputs

Use these inputs to customise the action.

Input Name | Default | Required? | Description
------------ | ------------- | ------------ | -------------
deploy_key | N/A | Y | The Hatchbox project deploy key from 
branch | master | N | The branch that needs to be deployed

You can find the "deploy key" in the URL on the App's Deploy tab in Hatchbox. For example, it would show:
```
https://www.hatchbox.io/webhooks/github/push/XYZ
```

You'd set HATCHBOX_DEPLOY_KEY to XYZ in your GitHub Secrets.

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
    - uses: hatchboxio/github-hatchbox-deploy-action@v1
      with:
        deploy_key: ${{ secrets.HATCHBOX_DEPLOY_KEY }}
        branch: master
```
