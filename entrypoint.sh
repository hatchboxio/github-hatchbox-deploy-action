#!/bin/sh -l

set -e

url="https://app.hatchbox.io/webhooks/deployments/$INPUT_DEPLOY_KEY?sha=$INPUT_SHA"
retry_minutes="$INPUT_RETRY_MINUTES"

case "$retry_minutes" in
  ''|*[!0-9]*) echo "retry_minutes must be a whole number of minutes, got '$retry_minutes'"; exit 1 ;;
esac

deadline=$(( $(date +%s) + retry_minutes * 60 ))

# Hatchbox can be briefly unavailable during maintenance, so retry server errors
# (including Cloudflare's 52x) and failed connections until the deadline. Any other
# response, like an invalid deploy key or SHA, fails right away.
while :; do
  rm -f /tmp/response
  status=$(curl -sS -X POST -o /tmp/response -w '%{http_code}' --connect-timeout 10 --max-time 30 "$url") || status=000

  case "$status" in
    000|5*) ;;
    *) break ;;
  esac

  if [ "$(date +%s)" -ge "$deadline" ]; then
    echo "Giving up after $retry_minutes minutes"
    break
  fi

  echo "Hatchbox.io is unavailable (HTTP $status), retrying in 30 seconds"
  sleep 30
done

case "$status" in
  2*)
    echo "response=$(cat /tmp/response)" >> "$GITHUB_OUTPUT"
    echo "Deployment has started on Hatchbox.io"
    ;;
  *)
    echo "Hatchbox.io returned HTTP $status"
    cat /tmp/response 2>/dev/null && echo
    exit 1
    ;;
esac
