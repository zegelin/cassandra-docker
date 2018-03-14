#!/bin/bash -ue

echoerr() { echo "$@" 1>&2; }

if (( $# != 1 )); then
    echoerr "$0: illegal number of arguments"
    echoerr "usage: $0 elassandra_version"
    exit -1
fi

elassandra_version=$1

docker build -t instaclustr/elassandra:${elassandra_version} ${elassandra_version}
