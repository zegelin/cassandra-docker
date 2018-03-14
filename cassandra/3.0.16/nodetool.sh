#!/bin/bash -ue

. /usr/share/cassandra/cassandra.in.sh

exec -a cassandra /usr/bin/java -cp "${CLASSPATH}" org.apache.cassandra.tools.NodeTool $@