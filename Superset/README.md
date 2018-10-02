# Superset

Docker image for [Superset](https://github.com/ApacheInfra/superset).

## Postgres error (world's bank dashboard)

    Changing the column name to include double quotes works.
    SELECT country_name AS country_name, SUM(SP_POP_TOTL) AS "sum__SP_POP_TOTL"
    FROM wb_health_population
    WHERE year >= '2014-01-01 00:00:00' AND year <= '2014-01-02 00:00:00' GROUP BY country_name ORDER BY "sum__SP_POP_TOTL" DESC
    LIMIT 50000
    
    to
    
    SELECT country_name AS country_name, SUM("SP_POP_TOTL") AS "sum__SP_POP_TOTL"
    FROM wb_health_population
    WHERE year >= '2014-01-01 00:00:00' AND year <= '2014-01-02 00:00:00' GROUP BY country_name ORDER BY "sum__SP_POP_TOTL" DESC
    LIMIT 50000

## Examples

Navigate to the [`examples`](./examples) directory to view examples of how to configure Superset with MySQL, PostgreSQL, or SQLite.


## Versions

This repo is tagged in parallel with superset. 


## Configuration

Follow the [instructions](https://superset.incubator.apache.org/installation.html#configuration) provided by Apache Superset for writing your own `superset_config.py`. Place this file in a local directory and mount this directory to `/etc/superset` inside the container. This location is included in the image's `PYTHONPATH`. Mounting this file to a different location is possible, but it will need to be in the `PYTHONPATH`.

View the contents of the [`examples`](./examples) directory to see some simple `superset_config.py` samples.


## Volumes

The image defines two data volumes: one for mounting configuration into the container, and one for data (logs, SQLite DBs, &c).

The configuration volume is located alternatively at `/etc/superset` or `/home/superset`; either is acceptable. Both of these directories are included in the `PYTHONPATH` of the image. Mount any configuration (specifically the `superset_config.py` file) here to have it read by the app on startup.

The data volume is located at `/var/lib/superset` and it is where you would mount your SQLite file (if you are using that as your backend), or a volume to collect any logs that are routed there. This location is used as the value of the `SUPERSET_HOME` environmental variable.

## Database Initialization

After starting the Superset server, initialize the database with an admin user and Superset tables using the `superset-init` helper script:

```bash
docker exec -it docker-superset chmod +x /usr/local/bin/superset-init && \
docker exec -it docker-superset chmod +x /usr/local/bin/superset-demo && \
docker exec -it docker-superset /usr/local/bin/superset-init
```

or with demo dashboards


    ```bash
    docker exec -it docker-superset chmod +x /usr/local/bin/superset-init && \
    docker exec -it docker-superset chmod +x /usr/local/bin/superset-demo && \
    docker exec -it docker-superset /usr/local/bin/superset-init
    ```

## Upgrading

Upgrading to a newer version of superset can be accomplished by re-pulling `amancevice/superset`at a specified superset version or `latest` (see above for more on this). Remove the old container and re-deploy, making sure to use the correct environmental configuration. Finally, ensure the superset database is migrated up to the head:

```bash
# Pull desired version
docker pull amancevice/superset

# Remove the current container
docker rm -f superset-old

# Deploy a new container ...
docker run --detach --name superset-new [options] amancevice/superset

# Upgrade the DB
docker exec superset-new superset db upgrade
```
