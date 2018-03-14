#!/bin/bash -ue

echoerr() { echo "$@" 1>&2; }

if (( $# != 2 )); then
    echoerr "$0: illegal number of arguments"
    echoerr "usage: $0 elassandra_version cassandra_version"
    exit -1
fi

elassandra_version=$1
cassandra_version=$2

dir=${elassandra_version}

cp -R _template/ ${dir}
sed -i .bak -e "s/@@ELASSANDRA_VERSION@@/${elassandra_version}/g; s/@@CASSANDRA_VERSION@@/${cassandra_version}/g;" ${dir}/Dockerfile
