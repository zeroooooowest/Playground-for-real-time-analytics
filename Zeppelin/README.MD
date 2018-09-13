#Important note
Needs sockets, doesn't work correctly with proxy!!!!!!

## Zeppelin Properties
There are two locations you can configure Apache Zeppelin.

* Environment variables can be defined conf/zeppelin-env.sh(conf\zeppelin-env.cmd for Windows).
* Java properties can be defined in conf/zeppelin-site.xml.
If both are defined, then the **environment variables** will take priority.


	
| zeppelin-env.sh | zeppelin-site.xml | Default value | Description |
| ------ | ------ | ------ | ------ |
| ZEPPELIN_PORT  | zeppelin.server.port  | 8080  | Zeppelin server port  Note: Please make sure you're not using the same port with Zeppelin web application development port (default: 9000). |
| ZEPPELIN_SSL_PORT  | zeppelin.server.port  | 8443  | Zeppelin Server ssl port (used when ssl environment/property is set to true) |
| ZEPPELIN_MEM | N/A | -Xmx1024m -XX:MaxPermSize=512m | JVM mem options |
| ZEPPELIN_INTP_MEM | N/A | ZEPPELIN_MEM | JVM mem options for interpreter process |
| ZEPPELIN_JAVA_OPTS | N/A |  | JVM options |
| ZEPPELIN_ALLOWED_ORIGINS | zeppelin.server.allowed.origins | * | Enables a way to specify a ',' separated list of allowed origins for REST and websockets. e.g. http://localhost:8080 |
| ZEPPELIN_CREDENTIALS_PERSIST | zeppelin.credentials.persist | true | Persist credentials on a JSON file (credentials.json) |
| ZEPPELIN_CREDENTIALS_ENCRYPT_KEY | zeppelin.credentials.encryptKey |  | If provided, encrypt passwords on the credentials.json file (passwords will be stored as plain-text otherwise |
| N/A | zeppelin.anonymous.allowed| true | The anonymous user is allowed by default. |
| ZEPPELIN_SERVER_CONTEXT_PATH | zeppelin.server.context.path | / | Context path of the web application |
| ZEPPELIN_SSL | zeppelin.ssl | false |  |
| ZEPPELIN_SSL_CLIENT_AUTH | zeppelin.ssl.client.auth | false |  |
| ZEPPELIN_SSL_KEYSTORE_PATH | zeppelin.ssl.keystore.path | keystore |  |
| ZEPPELIN_SSL_KEYSTORE_TYPE | zeppelin.ssl.keystore.type | JKS |  |
| ZEPPELIN_SSL_KEYSTORE_PASSWORD | zeppelin.ssl.keystore.password |  |  |
| ZEPPELIN_SSL_KEY_MANAGER_PASSWORD | zeppelin.ssl.key.manager.password |  |  |
| ZEPPELIN_SSL_TRUSTSTORE_PATH | zeppelin.ssl.truststore.path |  |  |
| ZEPPELIN_SSL_TRUSTSTORE_TYPE | zeppelin.ssl.truststore.type |  |  |
| ZEPPELIN_SSL_TRUSTSTORE_PASSWORD | zeppelin.ssl.truststore.password |  |  |
| ZEPPELIN_NOTEBOOK_HOMESCREEN | zeppelin.notebook.homescreen |  |  |
| ZEPPELIN_NOTEBOOK_HOMESCREEN_HIDE | zeppelin.notebook.homescreen.hide | false | Hide the note ID set by ZEPPELIN_NOTEBOOK_HOMESCREEN on the Apache Zeppelin homescreen. For the further information, please read Customize your Zeppelin homepage. |
| ZEPPELIN_WAR_TEMPDIR | zeppelin.war.tempdir | webapps | Location of the jetty temporary directory |
| ZEPPELIN_NOTEBOOK_DIR | zeppelin.notebook.dir | notebook | The root directory where notebook directories are saved |
| ZEPPELIN_NOTEBOOK_S3_BUCKET | zeppelin.notebook.s3.bucket | zeppelin | S3 Bucket where notebook files will be saved |
| ZEPPELIN_NOTEBOOK_S3_USER | zeppelin.notebook.s3.user | user | User name of an S3 bucket e.g. `bucket/user/notebook/2A94M5J1Z/note.json` |
| ZEPPELIN_NOTEBOOK_S3_ENDPOINT | zeppelin.notebook.s3.endpoint | s3.amazonaws.com | Endpoint for the bucket |
| ZEPPELIN_NOTEBOOK_S3_KMS_KEY_ID | zeppelin.notebook.s3.kmsKeyID |  | AWS KMS Key ID to use for encrypting data in S3 (optional) |
| ZEPPELIN_NOTEBOOK_S3_EMP | zeppelin.notebook.s3.encryptionMaterialsProvider |  | Class name of a custom S3 encryption materials provider implementation to use for encrypting data in S3 (optional) |
| ZEPPELIN_NOTEBOOK_S3_SSE | zeppelin.notebook.s3.sse | false | Save notebooks to S3 with server-side encryption enabled |
| ZEPPELIN_NOTEBOOK_S3_SIGNEROVERRIDE | zeppelin.notebook.s3.signerOverride |  | Optional override to control which signature algorithm should be used to sign AWS requests |
| ZEPPELIN_NOTEBOOK_AZURE_CONNECTION_STRING | zeppelin.notebook.azure.connectionString |  | The Azure storage account connection string e.g. `DefaultEndpointsProtocol=https;` `AccountName=<accountName>;` `AccountKey=<accountKey>` |
| ZEPPELIN_NOTEBOOK_AZURE_SHARE | zeppelin.notebook.azure.share | zeppelin | Azure Share where the notebook files will be saved |
| ZEPPELIN_NOTEBOOK_AZURE_USER | zeppelin.notebook.azure.user | user | Optional user name of an Azure file share e.g. `share/user/notebook/2A94M5J1Z/note.json` |
| ZEPPELIN_NOTEBOOK_STORAGE | zeppelin.notebook.storage | org.apache.zeppelin.notebook.repo.GitNotebookRepo | Comma separated list of notebook storage locations |
| ZEPPELIN_NOTEBOOK_ONE_WAY_SYNC | zeppelin.notebook.one.way.sync | false | If there are multiple notebook storage locations, should we treat the first one as the only source of truth? |
| ZEPPELIN_NOTEBOOK_PUBLIC | zeppelin.notebook.public | true | Make notebook public (set only `owners`) by default when created/imported. If set to `false` will add `user` to `readers` and `writers` as well, making it private and invisible to other users unless permissions are granted. |
| ZEPPELIN_INTERPRETER_DIR | zeppelin.interpreter.dir | interpreter | Interpreter directory |
| ZEPPELIN_INTERPRETER_DEP_MVNREPO | zeppelin.interpreter.dep.mvnRepo | http://repo1.maven.org/maven2/ | Remote principal repository for interpreter's additional dependency loading |
| ZEPPELIN_INTERPRETER_OUTPUT_LIMIT | zeppelin.interpreter.output.limit | 102400 | Output message from interpreter exceeding the limit will be truncated |
| ZEPPELIN_INTERPRETER_CONNECT_TIMEOUT | zeppelin.interpreter.connect.timeout | 30000 | Output message from interpreter exceeding the limit will be truncated |
| ZEPPELIN_DEP_LOCALREPO | zeppelin.dep.localrepo | local-repo | Local repository for dependency loader. ex)visualiztion modules of npm. |
| ZEPPELIN_HELIUM_NODE_INSTALLER_URL | zeppelin.helium.node.installer.url | https://nodejs.org/dist/ | Remote Node installer url for Helium dependency loader |
| ZEPPELIN_HELIUM_NPM_INSTALLER_URL | zeppelin.helium.npm.installer.url | http://registry.npmjs.org/ | Remote Npm installer url for Helium dependency loader |
| ZEPPELIN_HELIUM_YARNPKG_INSTALLER_URL | zeppelin.helium.yarnpkg.installer.url | https://github.com/yarnpkg/yarn/releases/download/ | Remote Yarn package installer url for Helium dependency loader |
| ZEPPELIN_WEBSOCKET_MAX_TEXT_MESSAGE_SIZE | zeppelin.websocket.max.text.message.size | 1024000 | Size(in characters) of the maximum text message that can be received by websocket. |
| ZEPPELIN_SERVER_DEFAULT_DIR_ALLOWED | zeppelin.server.default.dir.allowed | false | Enable directory listings on server. |
| ZEPPELIN_NOTEBOOK_GIT_REMOTE_URL | zeppelin.notebook.git.remote.url |  | GitHub's repository URL. It could be either the HTTP URL or the SSH URL. For example git@github.com:apache/zeppelin.git |
| ZEPPELIN_NOTEBOOK_GIT_REMOTE_USERNAME | zeppelin.notebook.git.remote.username | token | GitHub username. By default it is `token` to use GitHub's API |
| ZEPPELIN_NOTEBOOK_GIT_REMOTE_ACCESS_TOKEN | zeppelin.notebook.git.remote.access-token | token | GitHub access token to use GitHub's API. If username/password combination is used and not GitHub API, then this value is the password |
| ZEPPELIN_NOTEBOOK_GIT_REMOTE_ORIGIN | zeppelin.notebook.git.remote.origin | token | GitHub remote name. Default is `origin` |
|  |  |  |  |
|  |  |  |  |
