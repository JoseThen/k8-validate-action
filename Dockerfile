FROM alpine:latest

LABEL "com.github.actions.name"="Kube Yaml Validation"

LABEL "com.github.actions.description"="Validate Yaml files for kubernetes when a PR is created"

LABEL "com.github.actions.icon"="activity"

LABEL "com.github.actions.color"="blue"

RUN	apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    jq

COPY commands /usr/bin/gitCheck

WORKDIR /validator

COPY . /validator


# ENTRYPOINT ["kubectl", "apply", "--validate=true", "--dry-run=true", "--filename=/validator/"]
ENTRYPOINT ["gitCheck"]