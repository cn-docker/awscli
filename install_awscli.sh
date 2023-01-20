#!/usr/bin/env bash

# Exit immediately if a command exits with a nonzero exit value.
set -e

echo "========================================="
echo "Building and installing AWS Cli version 2"
echo "========================================="

echo "--> Install AWS Cli build dependencies as a virtual package"
apk add --no-cache --virtual .aws-cli-build-deps git build-base libffi-dev cmake python3 py3-pip python3-dev gcompat

echo "--> Clone the AWS Cli repository"
git clone --single-branch --depth 1 -b ${AWS_CLI_VERSION} https://github.com/aws/aws-cli.git

echo "--> cd into the cloned repository"
cd aws-cli

echo "--> Start a Pyhon virtual environment"
python -m venv venv
. venv/bin/activate

echo "--> Build AWS Cli"
scripts/installers/make-exe

echo "--> Install AWS Cli"
unzip -q dist/aws-cli-exe.zip
aws/install

echo "--> Remove cloned repository"
rm -rf aws-cli

echo "--> Delete virtual package with AWS Cli build dependencies"
apk del .aws-cli-build-deps
