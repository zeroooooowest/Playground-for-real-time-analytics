# Druid cluster

Docker Druid

    Tags:
    0.12.2
    
What is Druid?

    Druid is an open-source analytics data store designed for business intelligence (OLAP) queries on event data. Druid provides low latency (real-time) data ingestion, flexible data exploration, and fast data aggregation. Existing Druid deployments have scaled to trillions of events and petabytes of data. Druid is most commonly used to power user-facing analytic applications.
    Druid being a complex system, the best way to get up and running with a cluster is to use the docker-compose file provided.

Documentation

    Work in progress

Configuration

    Available environment options:
    DRUID_XMX '-'
    DRUID_XMS '-'
    DRUID_NEWSIZE '-'
    DRUID_MAXNEWSIZE '-'
    DRUID_HOSTNAME '-'
    
## Examples
kafka ingesting task

    curl -X POST -H 'Content-Type: application/json' -d @Druid/examples/supervisor-spec.json http://localhost:8081/druid/indexer/v1/supervisor
    
hadoop ingesting task

    curl -X 'POST' -H 'Content-Type:application/json' -d @Druid/examples/truck-index-hadoop.json http://localhost:8090/druid/indexer/v1/task    


## OutOfMemory

    https://github.com/apache/incubator-druid/issues/4708
    Hello. Some time ago we tried to index one of our datasources and strange error occurred.
    
    In our batch indexing spec we've put the value "1970-01-01T00:00:00.000Z/2969-12-31T23:59:59.999Z" in field spec.dataSchema.granularitySpec.intervals as the only element of this array. This value was of course put there because of mistake in on of our scripts but posting it to Druid had interesting consequences (we did not want to index 1000 years of data).
    
    As a result, parsing of such interval crashed our Druid services - probably middle manager. Every attempt to parse this configuration file ended in OutOfMemoryError in heap space. After a bit of investigation, we've came to conclusion. Our middle managers use 64MB of memory for Java heap space (as it is advised in http://druid.io/docs/latest/configuration/production-cluster.html) and error came from UniformGranularitySpec class. Looking into code revealed that this error is caused by slicing given interval into granular intervals - all happens in this class constructor. Probably our 1000 years period was sliced into so many pieces that middle manager easily run out of memory.