# Hatchbox Notify Deploy Action

Sending deployment notifications to Hatchbox.

#### Inputs

Use these inputs to customise the action.

Input Name | Default | Required? | Description
------------ | ------------- | ------------ | -------------
deploy_key | N/A | Y | The Hatchbox project deploy key 
classic | false | N | If Hatchbox Classic is used or not
branch | master | N | (Hatchbox Classic Only) The branch to be deployed


#### Deploy Key
Set HATCHBOX_DEPLOY_KEY to XYZ in your GitHub Secrets.

**Hatchbox v2**

You can find the "deploy key" in the URL on the App's Repository tab in Hatchbox v2. For example, it would show:

```
https://app.hatchbox.io/webhooks/deployments/XYZ?latest=true
```

**Hatchbox Classic**

You can find the "deploy key" in the URL on the App's Deploy tab in Hatchbox Classic. For example, it would show:
```
https://www.hatchbox.io/webhooks/github/push/XYZ
```

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
        classic: false
```
