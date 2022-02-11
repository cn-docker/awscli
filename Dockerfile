FROM python:3.10.2-alpine
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install dependencies
RUN apk add ---no-cache --update groff less && \
    rm -rf /var/cache/apk/*

# Install AWS Cli
RUN pip install --no-cache-dir --upgrade awscliv2==2.0.2 && \
    rm -rf ~/.cache/pip

# Setup entrypoint
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
