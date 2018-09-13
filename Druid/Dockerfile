FROM ubuntu:14.04

# Set version which you want to build from
ENV DRUID_VERSION 0.12.2

# Druid env variable
ENV DRUID_XMX           '-'
ENV DRUID_XMS           '-'
ENV DRUID_NEWSIZE       '-'
ENV DRUID_MAXNEWSIZE    '-'
ENV DRUID_HOSTNAME      '-'
ENV DRUID_LOGLEVEL      '-'
ENV LOG_DIR var

# Java 8
RUN apt-get update \
      && apt-get install -y software-properties-common \
      && apt-add-repository -y ppa:webupd8team/java \
      && apt-get purge --auto-remove -y software-properties-common \
      && apt-get update \
      && echo oracle-java-8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
      && apt-get install -y oracle-java8-installer oracle-java8-set-default \
      && apt-get clean \
      && rm -rf /var/cache/oracle-jdk8-installer \
      && rm -rf /var/lib/apt/lists/*

#Druid
RUN wget -q --no-check-certificate --no-cookies -O - \
    http://static.druid.io/artifacts/releases/druid-$DRUID_VERSION-bin.tar.gz |\
    tar -xzf - -C /opt \
    && ln -s /opt/druid-$DRUID_VERSION /opt/druid

# add folder if we don't use hdfs and store data locally
RUN cd /opt/druid-$DRUID_VERSION \
    && mkdir log \
    && mkdir -p $LOG_DIR/tmp \
    && mkdir -p $LOG_DIR/druid/indexing-logs \
    && mkdir -p $LOG_DIR/druid/segments \
    && mkdir -p $LOG_DIR/druid/segment-cache \
    && mkdir -p $LOG_DIR/druid/task \
    && mkdir -p $LOG_DIR/druid/hadoop-tmp \
    && mkdir -p $LOG_DIR/druid/pids

COPY conf /opt/druid-$DRUID_VERSION/conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

#uncomment for getting extensions
#java -classpath "/opt/druid-$DRUID_VERSION/lib/*" \
#        io.druid.cli.Main tools pull-deps --clean -c \
#        io.druid.extensions: \
#                            mysql-metadata-storage:0.12.2 -c \
#                            io.druid.extensions.contrib:druid-rabbitmq:0.12.2 -h \
#                            org.apache.hadoop:hadoop-client:2.3.0 -h \
#                            org.apache.hadoop:hadoop-client:2.4.0

# Expose ports:
# - 8081: HTTP (coordinator)
# - 8082: HTTP (broker)
# - 8083: HTTP (historical)
# - 8090: HTTP (overlord)
# - 8091: HTTP (middleManager)

EXPOSE 8081
EXPOSE 8082
EXPOSE 8083
EXPOSE 8090
EXPOSE 8091

VOLUME /tmp
VOLUME /opt/druid-$DRUID_VERSION/var

ENTRYPOINT ["/docker-entrypoint.sh"]
