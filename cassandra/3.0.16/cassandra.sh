#!/bin/bash -ue

echoerr() { echo "$@" 1>&2; }

. /usr/share/cassandra/cassandra.in.sh

# sanity checks
for conf in "${CASSANDRA_CONF}/cassandra.yaml" "${CASSANDRA_CONF}/cassandra-env.sh"; do
    if [ ! -f "${conf}" ]; then
        echoerr "${conf}: File not found. Required to start Cassandra.";
        exit 1;
    fi
done

JVM_OPTS=${JVM_OPTS:=}
. ${CASSANDRA_CONF}/cassandra-env.sh


exec -a cassandra /usr/bin/java \
    -cp "${CASSANDRA_CONF}:${CASSANDRA_HOME}/*:${CASSANDRA_HOME}/lib/*" \
    ${JVM_OPTS} \
    -Dcassandra-foreground=yes \
    org.apache.cassandra.service.CassandraDaemon