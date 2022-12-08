FROM python:3.11.1-alpine
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install dependencies
RUN apk add ---no-cache --update groff less && \
    rm -rf /var/cache/apk/*

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --requirement requirements.txt && \
    rm -rf ~/.cache/pip

# Setup entrypoint
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
