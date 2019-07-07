FROM alpine:3.3

MAINTAINER Forrest Lin <forrest_lin@htc.com>

ENV LANG C.UTF-8
ENV ELASTALERT_HOME /opt/elastalert
ENV RULES_DIRECTORY ${ELASTALERT_HOME}/rules

ARG vcs_ref="Unknown"
ARG vcs_branch="Unknown"
ARG build_date="Unknown"

WORKDIR /opt

RUN apk add --update \
    ca-certificates \
    python \
    python-dev \
    py-pip \
    build-base \
    libffi-dev \
    openssl-dev \
  && rm -rf /var/cache/apk/*

WORKDIR ${ELASTALERT_HOME}

# Install Elastalert.
RUN pip install --upgrade pip && \
    pip install elastalert && \
    mkdir ${RULES_DIRECTORY}

ENTRYPOINT ["/opt/elastalert/docker-entrypoint.sh"]
CMD ["elastalert", "--verbose"]

COPY ./Dockerfile /
COPY ./docker-entrypoint.sh ${ELASTALERT_HOME}/docker-entrypoint.sh
COPY ./config.yaml ${ELASTALERT_HOME}/config.yaml

ADD ./rules ${RULES_DIRECTORY}/

