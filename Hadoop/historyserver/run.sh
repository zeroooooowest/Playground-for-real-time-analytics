#!/bin/bash

while ! nc -z 0.0.0.0 50070 >/dev/null 2>&1 < /dev/null; do
    echo "waiting for hdfs"
    sleep 5
done

if $(! hdfs dfs -test -d /druid) ; then
    hdfs dfs -mkdir /druid;
    hdfs dfs -chmod 777 /druid
fi

if $(! hdfs dfs -test -d /druid/segments) ; then
    hdfs dfs -mkdir /druid/segments;
    hdfs dfs -chmod 777 /druid/segments
fi

if $(! hdfs dfs -test -d /druid/indexing-logs) ; then
    hdfs dfs -mkdir /druid/indexing-logs;
    hdfs dfs -chmod 777 /druid/indexing-logs
fi

if $(! hdfs dfs -test -d /toy_datasets) ; then
    hdfs dfs -mkdir /toy_datasets;
    hdfs dfs -chmod 777 /toy_datasets
    hdfs dfs -put /wikiticker-2015-09-12-sampled.json.gz /toy_datasets/wikiticker-2015-09-12-sampled.json.gz
fi

$HADOOP_PREFIX/bin/yarn --config $HADOOP_CONF_DIR timelineserver