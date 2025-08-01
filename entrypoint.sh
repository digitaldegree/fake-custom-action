#!/bin/bash
set -e

echo "Triggered by: $GITHUB_ACTOR"

if [[ "$GITHUB_EVENT_NAME" == "push" ]]; then
  echo "Checking commit: $GITHUB_SHA"
  count=$(git diff-tree --no-commit-id --name-only -r "$GITHUB_SHA" | wc -l)
  echo "Files changed in commit: $count"
else
  echo "Event '$GITHUB_EVENT_NAME' is not a push. Skipping file count."
fi
