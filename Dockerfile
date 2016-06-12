FROM alpine:3.3

ENV GITLAB_HOST="https://gitlab.com" \
    GITLAB_TOKEN="qwerty" \
    COMMAND="help"

RUN apk add --update curl jq

COPY ./ /

CMD ["/bin/sh", "/entry.sh"]
