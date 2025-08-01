#!/bin/bash
set -e

echo "Triggered by: $GITHUB_ACTOR"

if [[ "$GITHUB_EVENT_NAME" == "push" ]]; then
  echo "Checking commit: $GITHUB_SHA"
  FILES=$(jq -r '[.commits[].added[], .commits[].modified[]] | unique[]' "$GITHUB_EVENT_PATH")
  echo "📄 Files changed in commit: $FILES"
else
  echo "⏭️ Event '$GITHUB_EVENT_NAME' is not a push. Skipping file count."
fi
