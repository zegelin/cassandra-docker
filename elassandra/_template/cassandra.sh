#!/bin/bash -ue

echoerr() { echo "$@" 1>&2; }

. /usr/share/cassandra/cassandra.in.sh

echo "Running as $(id)"

# sanity checks
for conf in "${CASSANDRA_CONF}/cassandra.yaml" "${CASSANDRA_CONF}/cassandra-env.sh"; do
    if [ ! -f "${conf}" ]; then
        echoerr "${conf}: File not found. Required to start Elassandra.";
        exit 1;
    fi
done

JVM_OPTS=${JVM_OPTS:=}
. ${CASSANDRA_CONF}/cassandra-env.sh

# Elasandra wants these as environement variables
export CASSANDRA_CONF
export CASSANDRA_HOME

exec -a cassandra /usr/bin/java \
    -cp "${CLASSPATH}" \
    ${JVM_OPTS} \
    -Dcassandra-foreground=yes \
    org.apache.cassandra.service.ElassandraDaemon