#!/bin/bash

PG_SSL=${PG_SSL:-}

PG_TRUST_LOCALNET=${PG_TRUST_LOCALNET:-$PSQL_TRUST_LOCALNET} # backward compatibility
PG_TRUST_LOCALNET=${PG_TRUST_LOCALNET:-false}

REPLICATION_MODE=${REPLICATION_MODE:-$PSQL_MODE} # backward compatibility
REPLICATION_MODE=${REPLICATION_MODE:-}
REPLICATION_USER=${REPLICATION_USER:-}
REPLICATION_PASS=${REPLICATION_PASS:-}
REPLICATION_HOST=${REPLICATION_HOST:-}
REPLICATION_PORT=${REPLICATION_PORT:-5432}
REPLICATION_SSLMODE=${REPLICATION_SSLMODE:-prefer}

DB_NAME=${DB_NAME:-}
DB_USER=${DB_USER:-}
DB_PASS=${DB_PASS:-}
DB_TEMPLATE=${DB_TEMPLATE:-template1}

DB_EXTENSION=${DB_EXTENSION:-}