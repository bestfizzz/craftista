FROM jenkins/agent:latest-alpine-jdk17

USER root

RUN apk add --no-cache \
      docker-cli \
      docker-compose \
    && addgroup -S docker \
    && adduser jenkins docker

USER jenkins
