#!/bin/bash -xue

echoerr() { echo "$@" 1>&2; }

if (( $# != 2 )); then
    echoerr "$0: illegal number of arguments"
    echoerr "usage: $0 distribution version"
    exit -1
fi

distro=$1
version=$2

docker build -t instaclustr/base-openjre base-openjre

cd ${distro} && ./build.sh ${version}
