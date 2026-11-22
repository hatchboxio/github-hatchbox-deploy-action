### v2.1

* Retry server errors and failed connections for up to `retry_minutes` (default 10) so deploys survive Hatchbox.io maintenance
* Stop echoing the request URL, which contains the deploy key, to the log

### v2

* Drop Hatchbox Classic support
* Deploy using ${{ github.sha }} instead of latest branch commit
* Include response in GitHub Action outputs
* Raise error on failure

### v1

* Trigger deployments in Hatchbox.io and Hatchbox Classic