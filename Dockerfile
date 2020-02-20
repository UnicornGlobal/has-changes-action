FROM ubuntu:latest

LABEL "com.github.actions.name"="Has Changes"
LABEL "com.github.actions.description"="Check if a git repository has any uncommitted changes"
LABEL "com.github.actions.icon"="info"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="http://github.com/UnicornGlobal/has-changes-action"
LABEL "homepage"="http://github.com/UnicornGlobal/has-changes-action"

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
