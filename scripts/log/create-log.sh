#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/campaigns/${ID}/campaign_logs"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "campaign_log": {
      "title": "'"${TITLE}"'",
      "log": "'"${LOG}"'"
    }
  }'

echo
