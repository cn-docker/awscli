FROM alpine:3.17.1
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# renovate: datasource=github-tags depName=aws/aws-cli
ARG AWS_CLI_VERSION=2.9.16

# Install dependencies
RUN apk add --no-cache --update bash groff less && \
    rm -rf /var/cache/apk/*

# Install AWS Cli version 2
COPY install_aws-cli.sh /tmp/install_aws-cli.sh
RUN /tmp/install_aws-cli.sh && \
    rm /tmp/install_aws-cli.sh

# Setup entrypoint
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
