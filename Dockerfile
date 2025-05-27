FROM jenkins/inbound-agent:alpine-jdk17

USER root

RUN apk add --no-cache docker-cli docker-compose \
 && addgroup docker \
 && adduser jenkins docker

USER jenkins
