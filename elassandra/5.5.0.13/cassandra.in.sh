CASSANDRA_CONF=/etc/cassandra
CASSANDRA_HOME=/usr/share/cassandra

# because ElasticSearch's JarHell wants concrete paths, not wildcards
CLASSPATH="${CASSANDRA_CONF}:"$(find "${CASSANDRA_HOME}"/lib -name "*.jar" -print0 | sed -e "s/\x0/:/g;s/:$//")