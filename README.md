# Hatchbox Notify Deploy Action

Sending deployment notifications to Hatchbox.

#### Inputs

Use these inputs to customise the action.

Input Name | Default | Required? | Description
------------ | ------------- | ------------ | -------------
deploy_key | N/A | Y | The Hatchbox project deploy key
branch | master | N | The branch that needs to be deployed

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
    - uses: lorismaz/github-hatchbox-deploy-action@v1
      with:
        deploy_key: ${{ secrets.HATCHBOX_DEPLOY_KEY }}
        branch: master
```
