#!/bin/bash

ENCODED_PROJECT=`echo -n $PROJECT | jq -s -R -r @uri`
PR=$(curl -s \
          -H "PRIVATE-TOKEN: $GITLAB_TOKEN" \
          "$GITLAB_HOST/api/v3/projects/$ENCODED_PROJECT")

PROJECT_ID=`echo $PR | jq ".id"`

ISSUE_TITLE=`echo $COMMAND | cut -d "\"" -f2`
ISSUE_DESCRIPTION=`echo $COMMAND | cut -d "\"" -f4`

ISSUE=$(curl -s \
    -X POST \
    -H "PRIVATE-TOKEN: $GITLAB_TOKEN" \
    "$GITLAB_HOST/api/v3/projects/$PROJECT_ID/issues" \
    -d title="$ISSUE_TITLE" \
    -d description="$ISSUE_DESCRIPTION")

ID=`echo $ISSUE | jq ".iid"`

echo "Created new issue $GITLAB_HOST/$PROJECT/issues/$ID"
