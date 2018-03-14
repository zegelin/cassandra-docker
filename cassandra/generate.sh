#!/bin/bash -ue

echoerr() { echo "$@" 1>&2; }

if (( $# != 1 )); then
    echoerr "$0: illegal number of arguments"
    echoerr "usage: $0 cassandra_version"
    exit -1
fi

cassandra_version=$1

dir=${cassandra_version}

cp -R _template/ ${dir}
sed -i .bak -e "s/@@CASSANDRA_VERSION@@/${cassandra_version}/g;" ${dir}/Dockerfile

docker build -t instaclustr/cassandra:${cassandra_version} ${dir}
