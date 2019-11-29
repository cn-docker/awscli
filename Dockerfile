FROM python:3-alpine
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install dependencies
RUN apk add --update groff less && \
    rm -rf /var/cache/apk/*

# Install AWS Cli
RUN pip install awscli --upgrade

# Setup entrypoint
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
