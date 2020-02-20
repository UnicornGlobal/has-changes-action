FROM alpine:latest

LABEL "com.github.actions.name"="Has Changes"
LABEL "com.github.actions.description"="Check if a git repository has any uncommitted changes"
LABEL "com.github.actions.icon"="info"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="http://github.com/UnicornGlobal/has-changes-action"
LABEL "homepage"="http://github.com/UnicornGlobal/has-changes-action"

RUN apk add --no-cache git bash

ADD has-changes.sh /
RUN chmod +x /has-changes.sh

ENTRYPOINT ["/has-changes.sh"]
