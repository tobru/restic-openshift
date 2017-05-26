FROM golang:1.8-alpine
MAINTAINER tobias@tobru.ch

ENV RESTIC_VERSION=v0.6.0-rc.1

# Build and install restic from source
RUN echo http://nl.alpinelinux.org/alpine/v3.4/community >> /etc/apk/repositories && \
    apk add --no-cache git fuse && \
    git clone -b "$RESTIC_VERSION" https://github.com/restic/restic && \
    cd restic && \
    go run build.go && \
    cp restic /usr/local/bin/ && \
    cd .. && \
    rm -rf restic && \
    apk del git

ENTRYPOINT ["/usr/local/bin/restic"]
