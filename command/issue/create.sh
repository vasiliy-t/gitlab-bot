#!/bin/bash

ISSUE_TITLE=`echo $COMMAND | cut -d "\"" -f2`
ISSUE_DESCRIPTION=`echo $COMMAND | cut -d "\"" -f4`

curl \
    -X POST \
    -H "PRIVATE-TOKEN: $GITLAB_TOKEN" \
    "$GITLAB_HOST/api/v3/projects/$PROJECT/issues" \
    -d title="$ISSUE_TITLE" \
    -d description="$ISSUE_DESCRIPTION"
