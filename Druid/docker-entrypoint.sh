#!/bin/bash
set -e

# Run as broker if needed
if [ "${1:0:1}" = '' ]; then
    set -- broker "$@"
fi

if [ "$DRUID_XMX" != "-" ]; then
    sed -ri 's/Xmx.*/Xmx'${DRUID_XMX}'/g' /opt/druid/conf/druid/$1/jvm.config
fi

if [ "$DRUID_XMS" != "-" ]; then
    sed -ri 's/Xms.*/Xms'${DRUID_XMS}'/g' /opt/druid/conf/druid/$1/jvm.config
fi

# need add parameter in /$1/jvm.config
#if [ "$DRUID_MAXNEWSIZE" != "-" ]; then
#    sed -ri 's/MaxNewSize=.*/MaxNewSize='${DRUID_MAXNEWSIZE}'/g' /opt/druid/conf/druid/$1/jvm.config
#fi

# need add parameter in /$1/jvm.config
#if [ "$DRUID_NEWSIZE" != "-" ]; then
#    sed -ri 's/NewSize=.*/NewSize='${DRUID_NEWSIZE}'/g' /opt/druid/conf/druid/$1/jvm.config
#fi

if [ "$DRUID_HOSTNAME" != "-" ]; then
    sed -ri 's/druid.host=.*/druid.host='${DRUID_HOSTNAME}'/g' /opt/druid/conf/druid/$1/runtime.properties
fi

if [ "$DRUID_LOGLEVEL" != "-" ]; then
    sed -ri 's/druid.emitter.logging.logLevel=.*/druid.emitter.logging.logLevel='${DRUID_LOGLEVEL}'/g' /opt/druid/conf/druid/_common/common.runtime.properties
fi

#if [ "$DRUID_USE_CONTAINER_IP" != "-" ]; then
#    ipaddress=`ip a|grep "global eth0"|awk '{print $2}'|awk -F '\/' '{print $1}'`
#    sed -ri 's/druid.host=.*/druid.host='${ipaddress}'/g' /opt/druid/conf/druid/$1/runtime.properties
#fi

#uncomment for getting extensions
#java -classpath "/opt/druid-$DRUID_VERSION/lib/*" \
#        io.druid.cli.Main tools pull-deps --clean -c \
#        io.druid.extensions: \
#                            mysql-metadata-storage:0.12.2 -c \
#                            io.druid.extensions.contrib:druid-rabbitmq:0.12.2 -h \
#                            org.apache.hadoop:hadoop-client:2.3.0 -h \
#                            org.apache.hadoop:hadoop-client:2.9.1

java `cat /opt/druid/conf/druid/$1/jvm.config | xargs` -cp /opt/druid/conf/druid/_common:/opt/druid/conf/druid/$1:/opt/druid/lib/* io.druid.cli.Main server $@
