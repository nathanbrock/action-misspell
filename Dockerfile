FROM alpine:3.15

ENV REVIEWDOG_VERSION=v0.14.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN wget -O - -q https://git.io/misspell | sh -s -- -b /usr/local/bin/

RUN apk --no-cache add git && \
    apk --no-cache add bash && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
