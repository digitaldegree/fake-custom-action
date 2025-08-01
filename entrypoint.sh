#!/bin/bash
set -e

echo "Triggered by: $GITHUB_ACTOR"

if [[ "$GITHUB_EVENT_NAME" == "push" ]]; then
  echo "Checking commit: $GITHUB_SHA"
  echo "EVENT JSON:"
  jq . "$GITHUB_EVENT_PATH"
else
  echo "Event '$GITHUB_EVENT_NAME' is not a push. Skipping file count."
fi
