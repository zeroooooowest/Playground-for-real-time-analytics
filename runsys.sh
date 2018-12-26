#!/usr/bin/env bash
# TODO create loop and functions.sh

echo -n "Do you wish to run/install test app (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-app"; then
      echo "Test app is already running"
    else
      echo 'App is not running.'
      echo "running test app..."
      screen -S app -d -m -- sh -c 'docker-compose run docker-app'
      sleep 5
      echo "docker-app is running. You can connect to instance with screen -r app."
      echo "Test app is available on 0.0.0.0:7090"
    fi
fi

echo -n "Do you wish to run/install Hadoop namenode (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-hadoop-namenode"; then
        echo "Hadoop namenode is already running"
    else
        echo 'Hadoop namenode is not running.'
        echo "running Hadoop namenode..."
        screen -S namenode -d -m -- sh -c 'docker-compose run docker-hadoop-namenode'
        sleep 5
        echo "docker-hadoop-namenode is running. You can connect to instance with screen -r namenode."
        echo "Hadoop namenode is available on 0.0.0.0:8020"
    fi
fi

echo -n "Do you wish to run/install Hadoop datanode1 (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-hadoop-datanode1"; then
        echo "Hadoop datanode1 is already running"
    else
        echo 'Hadoop datanode1 is not running.'
        echo "running Hadoop datanode1..."
        screen -S datanode1 -d -m -- sh -c 'docker-compose run docker-hadoop-datanode1'
        sleep 5sudo mc
        echo "docker-hadoop-datanode1 is running. You can connect to instance with screen -r datanode1."
        echo "Hadoop datanode1 is available on 0.0.0.0:50075"
    fi
fi

echo -n "Do you wish to run/install Hadoop resourcemanager (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-hadoop-resourcemanager"; then
        echo "Hadoop resourcemanager is already running"
    else
        echo 'Hadoop resourcemanager is not running.'
        echo "running Hadoop resourcemanager..."
        screen -S resourcemanager -d -m -- sh -c 'docker-compose run docker-hadoop-resourcemanager'
        sleep 5
        echo "docker-hadoop-resourcemanager is running. You can connect to instance with screen -r resourcemanager."
        echo "Hadoop resourcemanager is available on 0.0.0.0:8388"
    fi
fi

echo -n "Do you wish to run/install Hadoop historyserver (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-hadoop-historyserver"; then
        echo "Hadoop historyserver is already running"
    else
        echo 'Hadoop historyserver is not running.'
        echo "running Hadoop historyserver..."
        screen -S historyserver -d -m -- sh -c 'docker-compose run docker-hadoop-historyserver'
        sleep 5
        echo "docker-hadoop-historyserver is running. You can connect to instance with screen -r historyserver."
        echo "Hadoop historyserver is available on 0.0.0.0:8188"
    fi
fi

echo -n "Do you wish to run/install Hadoop nodemanager1 (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-hadoop-nodemanager1"; then
        echo "Hadoop nodemanager1 is already running"
    else
        echo 'Hadoop nodemanager1 is not running.'
        echo "running Hadoop nodemanager1..."
        screen -S nodemanager1 -d -m -- sh -c 'docker-compose run docker-hadoop-nodemanager1'
        sleep 5
        echo "docker-hadoop-nodemanager1 is running. You can connect to instance with screen -r nodemanager1."
        echo "Hadoop nodemanager1 is available on 0.0.0.0:8042"
    fi
fi


echo -n "Do you wish to run/install clickstream (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-divolte"; then
        echo "Clickstream is already running"
    else
        echo 'Clickstream is not running.'
        echo "running clickstream..."
        screen -S clickstream -d -m -- sh -c 'docker-compose run docker-divolte'
        sleep 5
         echo "docker-divolte is running. You can connect to instance with screen -r clickstream."
    fi
fi

echo -n "Do you wish to run/install Airflow (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-airflow"; then
        echo "Airflow is already running"
    else
        echo 'Airflow is not running.'
        echo "running airflow..."
        screen -S airflow -d -m -- sh -c 'docker-compose run docker-airflow'
        sleep 5
         echo "docker-airflow is running. You can connect to instance with screen -r airflow."
         echo "Airflow is available on 0.0.0.0:8780"
    fi
fi

echo -n "Do you wish to run/install Zeppelin (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-zeppelin"; then
        echo "Zeppelin is already running"
    else
        echo 'Zeppelin is not running.'
        echo "running Zeppelin..."
        screen -S zeppelin -d -m -- sh -c 'docker-compose run docker-zeppelin'
        sleep 5
        echo "docker-zeppelin is running. You can connect to instance with screen -r zeppelin."
        echo "Zeppelin is available on 0.0.0.0:8680"
    fi
fi

echo -n "Do you wish to run/install NiFi (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-nifi"; then
        echo "NiFi is already running"
    else
        echo 'NiFi is not running.'
        echo "running NiFi..."
        screen -S nifi -d -m -- sh -c 'docker-compose run docker-nifi'
        sleep 5
        echo "docker-nifi is running. You can connect to instance with screen -r nifi."
        echo "NiFi is available on 0.0.0.0:8980"
    fi
fi

echo -n "Do you wish to run/install Superset (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-superset"; then
        echo "Superset is already running"
    else
        echo 'Superset is not running.'
        echo "running Superset..."
        screen -S superset -d -m -- sh -c 'docker-compose run docker-superset'
        sleep 5
        echo "docker-superset is running. You can connect to instance with screen -r superset."
        echo "Superset is available on 0.0.0.0:8588"
    fi
fi

echo -n "Do you wish to run/install Druid coordinator (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-druid-coordinator"; then
        echo "Druid coordinator is already running"
    else
        echo 'Druid coordinator is not running.'
        echo "running Druid coordinator..."
        screen -S coordinator -d -m -- sh -c 'docker-compose run docker-druid-coordinator'
        sleep 5
        echo "docker-druid-coordinator is running. You can connect to instance with screen -r coordinator."
        echo "Druid coordinator is available on 0.0.0.0:8081"
    fi
fi

echo -n "Do you wish to run/install Druid overlord (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-druid-overlord"; then
        echo "Druid overlord is already running"
    else
        echo 'Druid overlord is not running.'
        echo "running Druid overlord..."
        screen -S overlord -d -m -- sh -c 'docker-compose run docker-druid-overlord'
        sleep 5
        echo "docker-druid-overlord is running. You can connect to instance with screen -r overlord."
        echo "Druid overlord is available on 0.0.0.0:8090"
    fi
fi

echo -n "Do you wish to run/install Druid historical (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-druid-historical"; then
        echo "Druid historical is already running"
    else
        echo 'Druid historical is not running.'
        echo "running Druid historical..."
        screen -S historical -d -m -- sh -c 'docker-compose run docker-druid-historical'
        sleep 5
        echo "docker-druid-historical is running. You can connect to instance with screen -r historical."
        echo "Druid historical is available on 0.0.0.0:8083"
    fi
fi

echo -n "Do you wish to run/install Druid middlemanager (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-druid-middlemanager"; then
        echo "Druid middlemanager is already running"
    else
        echo 'Druid middlemanager is not running.'
        echo "running Druid middlemanager..."
        screen -S middlemanager -d -m -- sh -c 'docker-compose run docker-druid-middlemanager'
        sleep 5
        echo "docker-druid-middlemanager is running. You can connect to instance with screen -r middlemanager."
        echo "Druid middlemanager is available on 0.0.0.0:8091"
    fi
fi

echo -n "Do you wish to run/install Druid broker (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    if sudo docker ps --format {{.Names}} | grep  "docker-druid-broker"; then
        echo "Druid broker is already running"
    else
        echo 'Druid broker is not running.'
        echo "running Druid broker..."
        screen -S broker -d -m -- sh -c 'docker-compose run docker-druid-broker'
        sleep 5
        echo "docker-druid-broker is running. You can connect to instance with screen -r broker."
        echo "Druid broker is available on 0.0.0.0:8082"
    fi
fi

echo -n "Do you wish to run real-time ingestion clickstream to Druid OLAP (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    curl -X POST -H 'Content-Type: application/json' -d @Druid/examples/supervisor-spec.json http://localhost:8081/druid/indexer/v1/supervisor
fi

echo -n "Do you wish to ingest data from HDFS to Druid OLAP (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    curl -X 'POST' -H 'Content-Type:application/json' -d @wikipedia-index-hadoop.json http://localhost:8090/druid/indexer/v1/task
fi
