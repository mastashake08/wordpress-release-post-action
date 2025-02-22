#!/bin/bash
set -e

echo "Fetching release details..."
TITLE="${{ github.event.release.name }}"
BODY="${{ github.event.release.body }}"

echo "Creating WordPress post..."
POST_DATA=$(jq -n \
  --arg title "$TITLE" \
  --arg content "$BODY" \
  --arg status "publish" \
  --argjson categories "[${WORDPRESS_CATEGORY_ID}]" \
  '{title: $title, content: $content, status: $status, categories: $categories}')

curl -X POST "$WORDPRESS_URL/wp-json/wp/v2/posts" \
  --user "$WORDPRESS_USERNAME:$WORDPRESS_APP_PASSWORD" \
  -H "Content-Type: application/json" \
  -d "$POST_DATA"

echo "WordPress post published successfully!"
