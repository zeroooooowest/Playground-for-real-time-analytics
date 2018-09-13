FROM openjdk:8-jre-alpine

# Java options, heap memory and used version

# Install required packages
RUN apk add --no-cache \
    bash \
    su-exec

# Specific zookeeper options for this image
ENV ZOOKEEPER_VERSION 3.4.12
ENV ZOO_SERVERS zookeeper1
ENV ZOO_ID 1
ENV ZOO_DATA_DIR /var/zookeeper

# Install Java oracle, zookeeper and cleanup unnecessary files
RUN mkdir -p /opt && wget -q -O - http://apache.mirrors.ovh.net/ftp.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper \
    && mkdir -p ${ZOO_DATA_DIR}

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 2181 2888 3888
VOLUME /var/zookeeper
ENTRYPOINT ["/docker-entrypoint.sh"]