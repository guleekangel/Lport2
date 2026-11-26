#!/usr/bin/env bash
# Copy the working copy of the page into ./public so Wrangler uploads it.
# Run this after editing index.html, before committing.
set -euo pipefail
cd "$(dirname "$0")"
cp index.html public/index.html
cp favicon.png public/favicon.png
echo "synced index.html + favicon.png -> public/"
