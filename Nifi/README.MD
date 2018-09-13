##Apache NiFi

---
Apache NiFi supports powerful and scalable directed graphs of data routing, transformation, and system mediation logic. Some of the high-level capabilities and objectives of Apache NiFi include:

* Web-based user interface
    * Seamless experience between design, control, feedback, and monitoring
* Highly configurable
    * Loss tolerant vs guaranteed delivery
    * Low latency vs high throughput
    * Dynamic prioritization
    * Flow can be modified at runtime
    * Back pressure
* Data Provenance
    *Track dataflow from beginning to end
* Designed for extension
    *Build your own processors and more
    *Enables rapid development and effective testing
* Secure
    * SSL, SSH, HTTPS, encrypted content, etc...
    * Multi-tenant authorization and internal authorization/policy management
    
## Starting the cluster
A user can start a minimal NiFi cluster with a simple `docker-compose up -d` in the `docker-compose` directory after configuring a desired NiFi version [above](#nifi-version-configuration).  This will start a NiFi cluster of one node in Compose's detached mode, with containers running in the background.

Typically, however, when clustering a user will likely want multiple instances of NiFi.  In this, more pragmatic perspective, a user would opt to instead run `docker-compose up --scale nifi=<number of instances> -d`, specifying a number of instances, such as `docker-compose up --scale nifi=3 -d`.  The `docker-compose up --scale` command can be performed at any point in the lifecycle of a running cluster instance and Compose will scale up or down to meet the number specified.  Consider the following user commands after a user starts a NiFi cluster specifying n-instances through `docker-compose up --scale nifi=n -d`:
  * `docker-compose up --scale nifi=n-m -d`:  Compose will notice that the requested number of instances (`n-m`) is less than those currently running and remove `m` instances of the `nifi` service from the running configuration,
  * `docker-compose up --scale nifi=n -d`:  Compose will notice that the requested number of instances is the number currently running and not perform any changes
  * `docker-compose up --scale nifi=n+m -d`:  Compose will notice that the requested number of instances (`n+m`) is more than those currently running and add `m` instances of the `nifi` service from the running configuration

**NOTE**:  NiFi currently does not provide any management of removed nodes from the cluster and, by virtue of how Compose works, data on those instances will be lost when instances are scaled down or removed.

## Monitoring the cluster

### Viewing logs
Logs for all running services (ZooKeeper and NiFi Nodes) can be viewed by performing `docker-compose logs` to receive a view of the collected logs thus far.  Alternatively, a user can follow the logs by adding the `-f` option such as `docker-compose logs -f`.

### Accessing the UI
To facilitate accommodating multiple instances of NiFi on one host, a fixed and exposed port is not specified in the docker-compose.yml configuration.  A user can find the host allocated port by performing `docker-compose port nifi 8080`.  This will return output similar to `0.0.0.0:32787`, indicating that the UI port, 8080, is available on all network interfaces of the host at port 32787.  If you are running the Compose environment on your local system, this would create an address of http://localhost:32787/nifi/.  If you would like to access the UI of other instances for additional evaluation, the `docker-compose port` command additionally accepts an `--index` option as follows `docker-compose port --index=<instance number> port nifi 8080`.

## Stopping the cluster
When a user has completed their usage of the cluster, all containers can be stopped by performing `docker-compose down` from the docker-compose folder. This will both stop and remove all containers associated with services in the docker-compose.yml configuration.

**NOTE**:  NiFi currently does not provide any management of removed nodes from the cluster and, by virtue of how Compose works, data on those instances will be lost when instances are scaled down or removed.

## Latest changes

### 1.8.0
- The NiFi Toolkit has been added to the image under the path `/opt/nifi/nifi-toolkit-current` also set as the environment variable `NIFI_TOOLKIT_HOME`
- The installation directory and related environment variables are changed to be version-agnostic to `/opt/nifi/nifi-current`:
```
docker run --rm --entrypoint /bin/bash apache/nifi:1.8.0 -c 'env | grep NIFI'
NIFI_HOME=/opt/nifi/nifi-current
NIFI_LOG_DIR=/opt/nifi/nifi-current/logs
NIFI_TOOLKIT_HOME=/opt/nifi/nifi-toolkit-current
NIFI_PID_DIR=/opt/nifi/nifi-current/run
NIFI_BASE_DIR=/opt/nifi
```
- A symlink refer to the new path for backward compatibility:
```
docker run --rm --entrypoint /bin/bash apache/nifi:1.8.0 -c 'readlink /opt/nifi/nifi-1.8.0'                                   /opt/nifi/nifi-current
```

# Docker Image Quickstart

## Capabilities
This image currently supports running in standalone mode either unsecured or with user authentication provided through:
   * [Two-Way SSL with Client Certificates](http://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#security-configuration)
   * [Lightweight Directory Access Protocol (LDAP)](http://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#ldap_login_identity_provider)

This image also contains the NiFi Toolkit (as of version 1.8.0) preconfigured to use either in secure and unsecure mode.

## Building
The Docker image can be built using the following command:

    docker build -t apache/nifi:latest .

This build will result in an image tagged apache/nifi:latest

    # user @ puter in ~/Development/code/apache/nifi/nifi-docker/dockerhub
    $ docker images
    REPOSITORY               TAG                 IMAGE ID            CREATED                 SIZE
    apache/nifi              latest              f0f564eed149        A long, long time ago   1.62GB

**Note**: The default version of NiFi specified by the Dockerfile is typically that of one that is unreleased if working from source.
To build an image for a prior released version, one can override the `NIFI_VERSION` build-arg with the following command:

    docker build --build-arg=NIFI_VERSION={Desired NiFi Version} -t apache/nifi:latest .

There is, however, no guarantee that older versions will work as properties have changed and evolved with subsequent releases.
The configuration scripts are suitable for at least 1.4.0+.

## Running a container

### Standalone Instance, Unsecured
The minimum to run a NiFi instance is as follows:

    docker run --name nifi \
      -p 8080:8080 \
      -d \
      apache/nifi:latest

This will provide a running instance, exposing the instance UI to the host system on at port 8080,
viewable at `http://localhost:8080/nifi`.

You can also pass in environment variables to change the NiFi communication ports and hostname using the Docker '-e' switch as follows:

    docker run --name nifi \
      -p 9090:9090 \
      -d \
      -e NIFI_WEB_HTTP_PORT='9090'
      apache/nifi:latest

For a list of the environment variables recognised in this build, look into the .sh/secure.sh and .sh/start.sh scripts

### Standalone Instance, Two-Way SSL
In this configuration, the user will need to provide certificates and the associated configuration information.
Of particular note, is the `AUTH` environment variable which is set to `tls`.  Additionally, the user must provide an
the DN as provided by an accessing client certificate in the `INITIAL_ADMIN_IDENTITY` environment variable.
This value will be used to seed the instance with an initial user with administrative privileges.
Finally, this command makes use of a volume to provide certificates on the host system to the container instance.

    docker run --name nifi \
      -v /User/dreynolds/certs/localhost:/opt/certs \
      -p 8443:8443 \
      -e AUTH=tls \
      -e KEYSTORE_PATH=/opt/certs/keystore.jks \
      -e KEYSTORE_TYPE=JKS \
      -e KEYSTORE_PASSWORD=QKZv1hSWAFQYZ+WU1jjF5ank+l4igeOfQRp+OSbkkrs \
      -e TRUSTSTORE_PATH=/opt/certs/truststore.jks \
      -e TRUSTSTORE_PASSWORD=rHkWR1gDNW3R9hgbeRsT3OM3Ue0zwGtQqcFKJD2EXWE \
      -e TRUSTSTORE_TYPE=JKS \
      -e INITIAL_ADMIN_IDENTITY='CN=Random User, O=Apache, OU=NiFi, C=US' \
      -d \
      apache/nifi:latest

### Standalone Instance, LDAP
In this configuration, the user will need to provide certificates and the associated configuration information.  Optionally,
if the LDAP provider of interest is operating in LDAPS or START_TLS modes, certificates will additionally be needed.
Of particular note, is the `AUTH` environment variable which is set to `ldap`.  Additionally, the user must provide a
DN as provided by the configured LDAP server in the `INITIAL_ADMIN_IDENTITY` environment variable. This value will be
used to seed the instance with an initial user with administrative privileges.  Finally, this command makes use of a
volume to provide certificates on the host system to the container instance.

#### For a minimal, connection to an LDAP server using SIMPLE authentication:

    docker run --name nifi \
      -v /User/dreynolds/certs/localhost:/opt/certs \
      -p 8443:8443 \
      -e AUTH=ldap \
      -e KEYSTORE_PATH=/opt/certs/keystore.jks \
      -e KEYSTORE_TYPE=JKS \
      -e KEYSTORE_PASSWORD=QKZv1hSWAFQYZ+WU1jjF5ank+l4igeOfQRp+OSbkkrs \
      -e TRUSTSTORE_PATH=/opt/certs/truststore.jks \
      -e TRUSTSTORE_PASSWORD=rHkWR1gDNW3R9hgbeRsT3OM3Ue0zwGtQqcFKJD2EXWE \
      -e TRUSTSTORE_TYPE=JKS \
      -e INITIAL_ADMIN_IDENTITY='cn=admin,dc=example,dc=org' \
      -e LDAP_AUTHENTICATION_STRATEGY='SIMPLE' \
      -e LDAP_MANAGER_DN='cn=admin,dc=example,dc=org' \
      -e LDAP_MANAGER_PASSWORD='password' \
      -e LDAP_USER_SEARCH_BASE='dc=example,dc=org' \
      -e LDAP_USER_SEARCH_FILTER='cn={0}' \
      -e LDAP_IDENTITY_STRATEGY='USE_DN' \
      -e LDAP_URL='ldap://ldap:389' \
      -d \
      apache/nifi:latest

#### The following, optional environment variables may be added to the above command when connecting to a secure  LDAP server configured with START_TLS or LDAPS

    -e LDAP_TLS_KEYSTORE: ''
    -e LDAP_TLS_KEYSTORE_PASSWORD: ''
    -e LDAP_TLS_KEYSTORE_TYPE: ''
    -e LDAP_TLS_TRUSTSTORE: ''
    -e LDAP_TLS_TRUSTSTORE_PASSWORD: ''
    -e LDAP_TLS_TRUSTSTORE_TYPE: ''

#### Clustering can be enabled by using the following properties to Docker environment variable mappings.

##### nifi.properties

| Property                                  | Environment Variable                   |
|-------------------------------------------|----------------------------------------|
| nifi.cluster.is.node                      | NIFI_CLUSTER_IS_NODE                   |
| nifi.cluster.node.address                 | NIFI_CLUSTER_ADDRESS                   |
| nifi.cluster.node.protocol.port           | NIFI_CLUSTER_NODE_PROTOCOL_PORT        |
| nifi.cluster.node.protocol.threads        | NIFI_CLUSTER_NODE_PROTOCOL_THREADS     |
| nifi.cluster.node.protocol.max.threads    | NIFI_CLUSTER_NODE_PROTOCOL_MAX_THREADS |
| nifi.zookeeper.connect.string             | NIFI_ZK_CONNECT_STRING                 |
| nifi.zookeeper.root.node                  | NIFI_ZK_ROOT_NODE                      |
| nifi.cluster.flow.election.max.wait.time  | NIFI_ELECTION_MAX_WAIT                 |
| nifi.cluster.flow.election.max.candidates | NIFI_ELECTION_MAX_CANDIDATES           |

##### state-management.xml

| Property Name  | Environment Variable   |
|----------------|------------------------|
| Connect String | NIFI_ZK_CONNECT_STRING |
| Root Node      | NIFI_ZK_ROOT_NODE      |


### Using the Toolkit

Start the container:

    docker run -d --name nifi apache/nifi

After NiFi has been started, it is possible to run toolkit commands against the running instance:

    docker exec -ti nifi nifi-toolkit-current/bin/cli.sh nifi current-user
    anonymous

## Configuration Information
The following ports are specified by default in Docker for NiFi operation within the container and
can be published to the host.

| Function                 | Property                      | Port  |
|--------------------------|-------------------------------|-------|
| HTTP Port                | nifi.web.http.port            | 8080  |
| HTTPS Port               | nifi.web.https.port           | 8443  |
| Remote Input Socket Port | nifi.remote.input.socket.port | 10000 |

The Variable Registry can be configured for the docker image using the `NIFI_VARIABLE_REGISTRY_PROPERTIES` environment variable.

=======
**NOTE**: If mapping the HTTPS port specifying trusted hosts should be provided for the property _nifi.web.proxy.host_.  This property can be specified to running instances
via specifying an environment variable at container instantiation of _NIFI\_WEB\_PROXY\_HOST_.