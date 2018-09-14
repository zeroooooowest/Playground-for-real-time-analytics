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
   
The image contains the full druid distribution and use the default druid cli.
If no command is provided the image will run as a broker.



The docker-compose file is setup to run on a macbook/centos.


based on following repos:

##### https://github.com/znly/docker-druid
##### https://github.com/druid-io/docker-druid/blob/master/Dockerfile
##### https://github.com/sameersbn/docker-postgresql
##### https://github.com/znly/docker-zookeeper
##### https://github.com/wurstmeister/kafka-docker
##### https://github.com/amancevice/superset
##### https://github.com/apache/nifi/tree/master/nifi-docker
##### https://github.com/puckel/docker-airflow



Quik start

