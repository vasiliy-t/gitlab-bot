#!/bin/sh

curl -s \
     -H "PRIVATE-TOKEN: $GITLAB_TOKEN" \
     "$GITLAB_HOST/api/v3/projects" |
jq ".[] | .http_url_to_repo | @text"
