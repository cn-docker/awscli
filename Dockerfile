FROM python:3-alpine
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

RUN pip install awscli --upgrade

