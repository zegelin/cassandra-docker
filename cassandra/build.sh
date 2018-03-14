#!/bin/bash -ue

echoerr() { echo "$@" 1>&2; }

if (( $# != 1 )); then
    echoerr "$0: illegal number of arguments"
    echoerr "usage: $0 cassandra_version"
    exit -1
fi

cassandra_version=$1

docker build -t instaclustr/cassandra:${cassandra_version} ${cassandra_version}
