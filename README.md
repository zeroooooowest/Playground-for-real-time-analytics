## How to use?


Clone  repository and run

    chmod +x Zookeeper/docker-entrypoint.sh &&\
    chmod +x Druid/docker-entrypoint.sh && \
    dos2unix Zookeeper/docker-entrypoint.sh && \
    dos2unix Postgres/runtime/functions && \
    dos2unix Postgres/runtime/env-defaults && \
    dos2unix Postgres/entrypoint.sh && \
    dos2unix Druid/docker-entrypoint.sh && \
    dos2unix Druid/conf/druid/broker/jvm.config && \
    dos2unix Druid/conf/druid/coordinator/jvm.config && \
    dos2unix Druid/conf/druid/historical/jvm.config && \
    dos2unix Druid/conf/druid/middleManager/jvm.config && \
    dos2unix Druid/conf/druid/overlord/jvm.config && \
    dos2unix Airflow/config/airflow.cfg &&\
    dos2unix Airflow/dags/tuto.py &&\
    dos2unix Airflow/script/entrypoint.sh &&\
    dos2unix Airflow/dags/tuto.py &&\
    docker-compose rm -f && docker-compose build && docker-compose up
   

The compose file is going to launch :

* 1 zookeeper node
* 1 postgres database
* 1 kafka standalone
* 1 superset
* 1 zeppelin
* 1 NiFi
* 1 airflow

and the following druid services :

   * 1 broker
   * 1 overlord
   * 1 middlemanager
   * 1 historical
   * 1 overlord
   
and the following hadoop services :
   
The image contains the full druid distribution and use the default druid cli.
If no command is provided the image will run as a broker.



The docker-compose file is setup to run on a macbook/centos.

## Ports configuration

| service name | port |
| ------   | ------ |
| Airflow  (web)               | 8780 |
| Airflow                      | 5555 |
| Airflow                      | 8793 | 
| Zeppelin (web)               | 8680 | 
| Zookeeper                    | 2181 | 
| Zookeeper                    | 2888 | 
| Zookeeper                    | 3888 | 
| Nifi (web)                   | 8980 |
| Nifi                         | 8982 |
| Nifi                         | 8443 | 
| Nifi                         | 10000| 
| Superset (web)               | 8588 | 
| Kafka                        | 9092 |
| Kafka                        | 9093 |
| Kafka                        | 9094 |
| Postgres                     | 5432 |
| Druid-coordinator            | 8081 |
| Druid-overlord               | 8090 |
| Druid-historical             | 8083 |
| Druid-middlemanager          | 8091 |
| Druid-broker                 | 8082 |
| Hadoop-resourcemanager (web) | 8088 |
| Hadoop-historyserver  (web)  | 8188 |
| Hadoop-nodemanager1   (web)  | 8042 |
| Hadoop-namenode              | 8020 |
| YARN                         | 8030 |
| YARN                         | 8031 |
| YARN                         | 8032 |
| YARN                         | 8033 |
| HADOOP datanode              | 50010 |
| HADOOP datanode (web)        | 50075 |
| HADOOP datanode              | 50020 |
| HADOOP namenode (web)        | 50070 |
based on following repos:

##### https://github.com/znly/docker-druid
##### https://github.com/druid-io/docker-druid/blob/master/Dockerfile
##### https://github.com/sameersbn/docker-postgresql
##### https://github.com/znly/docker-zookeeper
##### https://github.com/wurstmeister/kafka-docker
##### https://github.com/amancevice/superset
##### https://github.com/apache/nifi/tree/master/nifi-docker
##### https://github.com/puckel/docker-airflow
##### https://github.com/s22s/hadoop-docker



Quik start

