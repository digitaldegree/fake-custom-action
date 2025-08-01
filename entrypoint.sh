#!/bin/bash
set -e

echo "👤 Actor       : $GITHUB_ACTOR"
echo "#️⃣ Commit SHA  : $GITHUB_SHA"
echo "▶️ Event type  : $GITHUB_EVENT_NAME"

VISIBILITY=$(jq -r '.repository.visibility' "$GITHUB_EVENT_PATH")


if [[ "$VISIBILITY" == "private" ]]; then
  echo "🥽 Visibility: 🔒 This is a PRIVATE repository."
else
  echo "🥽 Visibility: 🌍 This is a PUBLIC repository."
fi