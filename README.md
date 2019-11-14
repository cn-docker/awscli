# AWS Cli Docker Image 

[![](https://img.shields.io/docker/pulls/cnservices/awscli)](https://hub.docker.com/r/cnservices/awscli/)
[![](hhttps://img.shields.io/docker/build/cnservices/awscli)](https://hub.docker.com/r/cnservices/awscli/)
[![](https://img.shields.io/docker/automated/cnservices/awscli)](https://hub.docker.com/r/cnservices/awscli/)
[![](https://img.shields.io/docker/stars/cnservices/awscli)](https://hub.docker.com/r/cnservices/awscli/)
[![](https://img.shields.io/github/license/cn-docker/awscli)](https://github.com/cn-docker/awscli)
[![](https://img.shields.io/github/issues/cn-docker/awscli)](https://github.com/cn-docker/awscli)
[![](https://img.shields.io/github/issues-closed/cn-docker/awscli)](https://github.com/cn-docker/awscli)
[![](https://img.shields.io/github/languages/code-size/cn-docker/awscli)](https://github.com/cn-docker/awscli)
[![](https://img.shields.io/github/repo-size/cn-docker/awscli)](https://github.com/cn-docker/awscli)

Image containing the AWS Cli executable.

# Usage

The image is ready to execute AWS Cli commands like:

        docker run cnservices/awscli <COMMAND>

## To provide AWS credentials you have two alternatives:

### Using environment variables

You can use environment the variables to authenticate the AWS Cli.

        docker run --env AWS_ACCESS_KEY_ID=<YOUR_ACCESS_KEY> --env AWS_SECRET_ACCESS_KEY=<YOUR_SECRET_KEY> cnservices/awscli <COMMAND>

Where:
- AWS_ACCESS_KEY_ID: Specifies an AWS access key associated with an IAM user or role.
- AWS_SECRET_ACCESS_KEY: Specifies the secret key associated with the access key. This is essentially the "password" for the access key.

### Using AWS profiles

You can use your AWS profiles to authenticate the AWS Cli.

        docker run --volume ~/.aws/:/root/.aws/ cnservices/awscli <COMMAND>

## Get into the container

To access the container you need to override the entry point:

        docker run -ti --entrypoint sh cnservices/awscli
