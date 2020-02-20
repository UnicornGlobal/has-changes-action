FROM alpine:git

LABEL "repository"="http://github.com/UnicornGlobal/has-changes-action"
LABEL "homepage"="http://github.com/UnicornGlobal/has-changes-action"

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
